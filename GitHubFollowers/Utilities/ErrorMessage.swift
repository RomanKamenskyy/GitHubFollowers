//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by roman on 30.09.2024.
//

import Foundation

enum ErrorMessage: String {
    case invalidUsername = "This username created an invalid request, please try another"
    case unableToComplete = "Unable to complete request. Check internet"
    case invalidResponse = "Invalid responce from the server"
    case invvalidData = "The data received from server is invalid"
}