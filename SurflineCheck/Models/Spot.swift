//
//  Spot.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 8/22/23.
//

import Foundation
import CoreLocation

struct Spot: Identifiable, Codable {
    let id: UUID
    let name: String
    //let location: CLLocation
    
    static var dummySpots = ["Ocean Beach", "Pacifica", "Fort Point", "Linda Mar", "Montara", "Rockaway", "Bolinas"]
}
