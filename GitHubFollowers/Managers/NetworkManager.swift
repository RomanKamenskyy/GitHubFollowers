//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by roman on 30.09.2024.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    //func getFollowers (for username: String, page: Int, completed: @escaping([Follower]?, ErrorMessage?) -> Void){
    func getFollowers (for username: String, page: Int, completed: @escaping(Result<[Follower], GHError>) -> Void){
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        print(endpoint)
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            //completed(nil, .invalidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invvalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                //completed(followers, nil)
                completed(.success(followers))
                    
            } catch {
                completed(.failure(.invvalidData))
                //completed(nil, error.localizedDescription)
            }
        }
        
        task.resume()
        
    }
    func getUserInfo (for username: String,  completed: @escaping(Result<User, GHError>) -> Void){
            let endpoint = baseURL + "/users/\(username)"
            
            print(endpoint)
            guard let url = URL(string: endpoint) else {
                completed(.failure(.invalidUsername))
                //completed(nil, .invalidUsername)
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let _ = error {
                    completed(.failure(.unableToComplete))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                    completed(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    completed(.failure(.invvalidData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let user = try decoder.decode(User.self, from: data)
                    //completed(followers, nil)
                    completed(.success(user))
                        
                } catch {
                    completed(.failure(.invvalidData))
                    //completed(nil, error.localizedDescription)
                }
            }
            
            task.resume()
            
        }
}
