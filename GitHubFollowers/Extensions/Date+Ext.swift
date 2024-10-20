//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by roman on 20.10.2024.
//

import Foundation


extension Date {
    func convertMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
