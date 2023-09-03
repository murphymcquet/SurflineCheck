//
//  Report.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 8/22/23.
//

import SwiftUI

struct Report: Identifiable, Codable, FirestoreDb {
    
    static var CollectionName: String { get { return "Reports" } }
    static var EmptyInstance: Any { get { return Report.sampleData[0] }}
    
    enum Boards: String, Codable, CaseIterable, Identifiable {
        case Shortboard, Groveler, Midlength, Longboard, Foamie, Stepup = "Step-up", Gun
        var id: String { return self.rawValue }
    }
    
    static var Ratings: [String] = [
        "Very Poor",
        "Poor",
        "Poor to Fair",
        "Fair",
        "Fair to Good",
        "Good",
        "Good to Epic",
        "Epic"
    ]
    
    static var RatingsColorMap: [String: Color] = [
        "Very Poor": Color.gray,
        "Poor": Color.blue,
        "Poor to Fair": Color("teal"),
        "Fair": Color.green,
        "Fair to Good": Color.yellow,
        "Good": Color.orange,
        "Good to Epic": Color("oxblood"),
        "Epic": Color.red
    ]
    
    
    struct ReportInfo: Codable {
        let worth: Bool
        let rating: String
        let recommendedBoards: [Boards]
        let recomendedSkill: [User.SkillLevel]
        let isPublic: Bool
        let details: String
    }
    
    var id = UUID()
    var timestamp: Date
    var spot: String
    var report: ReportInfo
    
    init(timestamp: Date, spot: String, report: ReportInfo) {
        self.timestamp = timestamp
        self.spot = spot
        self.report = report
    }
}

extension Report {
    static let sampleData: [Report] =
    [
        Report(timestamp: Date.now, spot: "Ocean Beach", report: ReportInfo(
            worth: true,
            rating: "Fair to Good",
            recommendedBoards: [Boards.Shortboard, Boards.Stepup],
            recomendedSkill: [User.SkillLevel.Intermediate, User.SkillLevel.Advanced, User.SkillLevel.Pro],
            isPublic: true,
            details: "Heavy and cold."
        )),
        Report(timestamp: Date.init(timeIntervalSinceNow: TimeInterval(integerLiteral: -240)), spot: "Ocean Beach", report: ReportInfo(
            worth: true,
            rating: "Good",
            recommendedBoards: [Boards.Shortboard, Boards.Stepup],
            recomendedSkill: [User.SkillLevel.Intermediate, User.SkillLevel.Advanced, User.SkillLevel.Pro],
            isPublic: false,
            details: "Gnarly."
        )),
        Report(timestamp: Date.now, spot: "Linda Mar", report: ReportInfo(
            worth: true,
            rating: "Fair",
            recommendedBoards: [Boards.Groveler, Boards.Longboard],
            recomendedSkill: [User.SkillLevel.Beginner, User.SkillLevel.Intermediate],
            isPublic: true,
            details: "Heavy and cold."
        )),
        Report(timestamp: Date.init(timeIntervalSinceNow: TimeInterval(integerLiteral: -300000)), spot: "Linda Mar", report: ReportInfo(
            worth: false,
            rating: "Poor",
            recommendedBoards: [Boards.Groveler, Boards.Longboard],
            recomendedSkill: [User.SkillLevel.Beginner, User.SkillLevel.Intermediate],
            isPublic: true,
            details: "Dogwater."
        )),
        Report(timestamp: Date.now, spot: "Rockaway", report: ReportInfo(
            worth: true,
            rating: "Fair",
            recommendedBoards: [Boards.Groveler, Boards.Longboard],
            recomendedSkill: [User.SkillLevel.Beginner, User.SkillLevel.Intermediate],
            isPublic: true,
            details: "Heavy and cold."
        )),
        Report(timestamp: Date.init(timeIntervalSinceNow: TimeInterval(integerLiteral: -300000)), spot: "Rockaway", report: ReportInfo(
            worth: false,
            rating: "Very Poor",
            recommendedBoards: [Boards.Groveler, Boards.Longboard],
            recomendedSkill: [User.SkillLevel.Beginner, User.SkillLevel.Intermediate],
            isPublic: true,
            details: "Very bad."
        )),
        Report(timestamp: Date.init(timeIntervalSinceNow: TimeInterval(integerLiteral: -3000000)), spot: "Rockaway", report: ReportInfo(
            worth: false,
            rating: "Poor",
            recommendedBoards: [Boards.Groveler, Boards.Longboard],
            recomendedSkill: [User.SkillLevel.Beginner, User.SkillLevel.Intermediate],
            isPublic: true,
            details: "Bad."
        )),
        Report(timestamp: Date.init(timeIntervalSinceNow: TimeInterval(integerLiteral: -100000)), spot: "Rockaway", report: ReportInfo(
            worth: false,
            rating: "Very Poor",
            recommendedBoards: [Boards.Groveler, Boards.Longboard],
            recomendedSkill: [User.SkillLevel.Beginner, User.SkillLevel.Intermediate],
            isPublic: true,
            details: "Very very bad."
        )),
        Report(timestamp: Date.init(timeIntervalSinceNow: TimeInterval(integerLiteral: -300000)), spot: "Rockaway", report: ReportInfo(
            worth: false,
            rating: "Very Poor",
            recommendedBoards: [Boards.Groveler, Boards.Longboard],
            recomendedSkill: [User.SkillLevel.Beginner, User.SkillLevel.Intermediate],
            isPublic: true,
            details: "Very bad."
        )),
        Report(timestamp: Date.init(timeIntervalSinceNow: TimeInterval(integerLiteral: -3000000)), spot: "Rockaway", report: ReportInfo(
            worth: false,
            rating: "Poor",
            recommendedBoards: [Boards.Groveler, Boards.Longboard],
            recomendedSkill: [User.SkillLevel.Beginner, User.SkillLevel.Intermediate],
            isPublic: true,
            details: "Bad."
        )),
        Report(timestamp: Date.init(timeIntervalSinceNow: TimeInterval(integerLiteral: -100000)), spot: "Rockaway", report: ReportInfo(
            worth: false,
            rating: "Very Poor",
            recommendedBoards: [Boards.Groveler, Boards.Longboard],
            recomendedSkill: [User.SkillLevel.Beginner, User.SkillLevel.Intermediate],
            isPublic: true,
            details: "Very very bad."
        )),
    ]
}
