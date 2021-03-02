//
//  Incident.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/21/21.
//


import Foundation
import Firebase

let db = Firestore.firestore()

enum typeIncident: String {
    case fight = "Fight"
    case medical = "Medical"
    case shooter = "Shooter"
    case other = "Other"
}

enum threatLevel {
    case low
    case medium
    case high
}

class Incident{
    var type : typeIncident
    var key : String?
    var info : String?
    var location: String?

    var timeCreated : Timestamp?
    var timeDisplay: String?
    
    init(inc: typeIncident) {
        type = inc
    }
    
    func submit(){
        
        timeCreated = Timestamp()
        
        var ref: DocumentReference? = nil
        ref = db.collection("incidents").addDocument(data: [
            "type": type.rawValue,
            "time": timeCreated!
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added to Incidents with ID: \(ref!.documentID)")
            }
        }
        
        db.collection("incidents").document(ref!.documentID).collection("subInformation").addDocument(data: [
            "info": info ?? "Backup Information"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added to subInformation with ID: \(ref!.documentID)")
            }
        }
    }
}
