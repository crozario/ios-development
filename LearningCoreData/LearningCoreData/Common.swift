//
//  Common.swift
//  LearningCoreData
//
//  Created by Crossley Rozario on 5/3/24.
//

import Foundation

class Common {
    static func generateRandomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).compactMap { _ in letters.randomElement() })
    }
    
    private init() { }
}
