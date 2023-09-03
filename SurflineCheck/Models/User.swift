//
//  Friend.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 8/22/23.
//

import Foundation

struct User: Identifiable, Codable {
    
    enum SkillLevel: String, Codable, CaseIterable, Identifiable {
        case Beginner, Intermediate, Advanced, Pro
        var id: String { return self.rawValue }
    }
    
    let id: UUID
    var firstName: String
    var lastName: String
    var dateOfBirth: Date
    var skill: SkillLevel
    var friends: [User]
    
    var age: Int {
        get {
            let calendar = NSCalendar.current
            let components = calendar.dateComponents([.year], from: dateOfBirth, to: Date())
            return components.year ?? -1
        }
    }
    // var reports: [Repot]
}

extension User {
    static let sampleData: [User] =
    [
        // TODO
    ]
}
