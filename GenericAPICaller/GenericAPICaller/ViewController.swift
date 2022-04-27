//
//  ViewController.swift
//  GenericAPICaller
//
//  Created by Thomas Cowern New on 4/27/22.
//

import UIKit

// Models

struct User: Codable {
    let name: String
    let email: String
}

struct TodoListItem: Codable {
    let title: String
    let completed: Bool
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
    
    
    struct Constants {
        static let userUrl = URL(string: "https://jsonplaceholder.typicode.com/users")
        static let todoUrl = URL(string: "https://jsonplaceholder.typicode.com/todos")
    }
    
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var users: [User] = []
    private var items: [TodoListItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        
        fetch()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }

    func fetch () {
        URLSession.shared.request(url: Constants.todoUrl, expecting: [TodoListItem].self) { [weak self] result in
            switch result {
            case .success(let items):
                DispatchQueue.main.async {
                    self?.items = items
                    self?.table.reloadData()
                }
               
            case.failure(let error):
                print(error)
            }
        }
    }

}

extension URLSession {
    
    // Enums for possible errors
    enum CustomError: Error {
        case invalidUrl
        case invalidData
    }
    
    // Request with generic
    func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        // Check for invalid url
        guard let  url = url else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        
        // Check for data error
        let task = dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            // Decode the results
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
