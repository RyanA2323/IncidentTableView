//
//  ViewController2.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/21/21.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var incidents: [Incident] = []
    var btnType: typeIncident = .other
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toVC3", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incidents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomCell
        
        if btnType == .shooter {
        cell.configure(pic: UIImage(named: "activeShooter")!, incident: incidents[0].type)
        } else if btnType == .fight {
            cell.configure(pic: UIImage(named: "fist")!, incident: incidents[0].type)
        } else if btnType == .medical {
            cell.configure(pic: UIImage(named: "starOfLife")!, incident: incidents[0].type)
        } else {
            cell.configure(pic: UIImage(named: "weirdPerson")!, incident: incidents[0].type)
        }
        
        return cell
    }
    

   
}
