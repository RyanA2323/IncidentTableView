//
//  ViewController3.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/26/21.
//

import UIKit

class ViewController3: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    @IBOutlet weak var textfieldOutlet: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    var info: [String] = []
    var ind: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
    }
    
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        //need to make sure there is something in the text field
        //maybe an alert
        info.append(textfieldOutlet.text!)
        tableview.reloadData()
        textfieldOutlet.text = ""
    }

    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        ind = indexPath
    }
    
    @IBAction func editAction(_ sender: UIBarButtonItem) {
        tableview.cellForRow(at: ind)?.textLabel?.text = textfieldOutlet.text!
        info[ind.row] = textfieldOutlet.text!
        textfieldOutlet.text = ""
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "myCell")!
        
        cell.textLabel?.text = info[indexPath.row]
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.textColor = UIColor.white
        return cell
    }

}
