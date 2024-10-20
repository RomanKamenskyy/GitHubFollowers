//
//  GHError.swift
//  GitHubFollowers
//
//  Created by roman on 20.10.2024.
//

import Foundation

enum GHError: String, Error {
    case invalidUsername = "This username created an invalid request, please try another"
    case unableToComplete = "Unable to complete request. Check internet"
    case invalidResponse = "Invalid responce from the server"
    case invvalidData = "The data received from server is invalid"
}
 
