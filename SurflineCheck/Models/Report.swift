//
//  Report.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 8/22/23.
//

import Foundation

struct Report: Identifiable, Codable, FirestoreDb {
    
    static var CollectionName: String { get { return "Reports" } }
    static var EmptyInstance: Any { get { return Report(spot: "", description: "") }}
    
    enum Boards: Codable {
        case shortboard, groveler, gun, stepUp, midlength, longboard
    }
    
    struct ReportInfo: Codable {
        let worth: Bool
        let rating: Int
        let ratingOutOf: Int
        let recommendedBoards: [Boards]
        let recomendedSkill: [User.SkillLevel]
        let isPublic: Bool
        let details: String
    }
    
    var id = UUID()
    //var userId: UUID
    var spot: String
    //var spot: Spot
    var description: String
    //var report: ReportInfo
    
    init(spot: String, description: String) {
        self.spot = spot
        self.description = description
    }
}

extension Report {
    static let sampleData: [Report] =
    [
        // TODO
    ]
}
