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
    case medical =  "Medical"
    case shooter =  "Shooter"
    case other = "Other"
}

class Incident{
    var type : typeIncident
    var info : String?
    var key : String?
    
    init(inc: typeIncident) {
        type = inc
    }
    
    func submit(){
        var ref: DocumentReference? = nil
        ref = db.collection("incidents").addDocument(data: [
            "type": type.rawValue,
            "info": "AAAAA A FIGHT!!!"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
