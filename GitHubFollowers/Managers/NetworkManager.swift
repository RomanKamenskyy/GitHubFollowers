//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by roman on 30.09.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com"
    
    private init() {}
    
    func getFollowers (for username: String, page: Int, completed: @escaping([Follower]?, String?) -> Void){
        let endpoint = baseURL + "/users/\(username)/followers?per_page=30&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "this username created an invalid request, please try another")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Unable to complete request. Check internet")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completed(nil, "Invalid responce from the server")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received from server is invalid")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
                    
            } catch {
                completed(nil, "The data received from server is invalid")
            }
        }
        
        task.resume()
        
    }
}
