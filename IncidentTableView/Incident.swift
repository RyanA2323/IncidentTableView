//
//  Incident.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/21/21.
//

import Foundation
enum typeIncident {
    case fight, medical, shooter, other
}

class Incident{
    var type : String
    
    init(inc: typeIncident) {
        type = "\(inc)"
    }
}
