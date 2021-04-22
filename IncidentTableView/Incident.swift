//
//  Incident.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/21/21.
//


import Foundation
import Firebase

let db = Firestore.firestore()
var defaults = UserDefaults.standard

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
    
    var pointx: CGFloat?
    var pointy: CGFloat?
    
    init(inc: typeIncident) {
        type = inc
    }
    
    func submit(){
        var ref: DocumentReference? = nil
        ref = db.collection("incidents").addDocument(data: [
            "type": type.rawValue,
            "time": Timestamp(),
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Incident object added with ID: \(ref!.documentID)")
                defaults.setValue(ref!.documentID, forKey: "currentIncidentKey")
                
                // Creating an Incident from the Button Screen provides a default subInfo document with location data
                ref = db.collection("incidents").document(ref!.documentID).collection("subInformation").addDocument(data: [
                    "info": "N/A",
                    "pointx": self.pointx ?? 0,
                    "pointy": self.pointy ?? 0,
                    "time": Timestamp()
                ] ) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("SubInfo object added with ID: \(ref!.documentID)")
                        defaults.setValue(ref!.documentID, forKey: "subInfoID")
                    }
                }
            }
        }
    }
}
