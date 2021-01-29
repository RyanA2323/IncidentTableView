//
//  Incident.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/21/21.
//

import Foundation
enum typeIncident: String {
    case fight = "fight"
    case medical = "medical"
    case shooter = "shooter"
    case other = "other"
}

class Incident{
    var type : typeIncident
    
    init(inc: typeIncident) {
        type = inc
    }
}
