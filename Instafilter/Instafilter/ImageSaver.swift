//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Thomas Cowern New on 3/21/22.
//

import Foundation
import UIKit

class ImageSaver: NSObject {
    var successHander: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writePhotoToAlbum (image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveComplete), nil)
    }
    
    @objc func saveComplete(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHander?()
        }
    }
}
