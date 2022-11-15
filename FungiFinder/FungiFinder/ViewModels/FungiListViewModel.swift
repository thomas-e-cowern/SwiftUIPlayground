//
//  FungiListViewModel.swift
//  FungiFinder
//
//  Created by Thomas Cowern on 11/15/22.
//

import Foundation
import FirebaseStorage
import Firebase
import FirebaseFirestoreSwift

class FungiListViewModel: ObservableObject {
    
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
    func uploadPhoto(data: Data, completion: @escaping (URL?) -> Void) {
        
        let imageName = UUID().uuidString
        let storageRef = storage.reference()
        let photoRef = storageRef.child("images/\(imageName).png")
        
        photoRef.putData(data, metadata: nil) { metadata, error in
            photoRef.downloadURL { url, error in
                if let error = error {
                    print("Error in uploadPhotos \(error.localizedDescription)")
                } else {
                    completion(url)
                }
            }
        }
    }
    
    func save(name: String, url: URL, completion: (Error?) -> Void) {
        
        guard let currentUser = Auth.auth().currentUser else {
            print("Problem with the current user")
            return
            
        }
        
        do {
            let _ = try db.collection("fungi")
                .addDocument(from: Fungi(name: name, url: url.absoluteString, userId: currentUser.uid))
            completion(nil)
                             
        } catch let error {
            completion(error)
        }
    }
}
