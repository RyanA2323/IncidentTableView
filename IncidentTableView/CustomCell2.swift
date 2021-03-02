//
//  CustomCell2.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 3/1/21.
//

import UIKit

class CustomCell2: UITableViewCell {

    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var additionalInfo: UILabel!
    
    func configure(loc: String, addInfo: String) {
        self.location.text = "Location: \(loc)"
        self.additionalInfo.text = "Additional Information: \(addInfo)"
    }
    
}
