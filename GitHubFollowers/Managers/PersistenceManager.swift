//
//  PersistenceManager.swift
//  GitHubFollowers
//
//  Created by roman on 21.10.2024.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorite"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GHError?) -> Void){
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll { $0.login == favorite.login }
                }
                
                completed(save(favorites: favorites))
                
            case .failure(let error):
                completed(error)
                
            }
        }
    }
    
    static func retrieveFavorites (completed: @escaping (Result<[Follower], GHError>) -> Void) {
        guard let favoitesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoitesData )
            //completed(followers, nil)
            completed(.success(favorites))
                
        } catch {
            completed(.failure(.unableToFavorites))
        }
    }
    
    static func save(favorites: [Follower]) -> GHError? {
        
        do {
            let encoder = JSONEncoder()
            let encodeFavorites = try encoder.encode(favorites)
            defaults.set(encodeFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorites
        }
    }
}
