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
    
  //  var location : String?
  //  var level : threatLevel?
  //  var time : Timestamp?
  //  var user : String?
    
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
    
    func submitSubInfo(doc: String, info: String){
        var ref: DocumentReference? = nil
        ref = db.collection("incidents").document(doc).collection("subInformation").addDocument(data: [
            "info": info
        ] ) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
