//
//  Incident.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/21/21.
//


import Foundation
enum typeIncident {
    case fight
    case medical
    case shooter
    case other
}

enum treatLevel {
    case low
    case medium
    case high
}

class Incident{
    var type : typeIncident
    var location : String
    var level : treatLevel
    
    init(inc: typeIncident) {
        type = inc
        location = "location"
        level = .low
    }
    
}
