//
//  MapViewControllerTwo.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 4/8/21.
//

import UIKit

class MapViewControllerTwo: UIViewController {
    @IBOutlet weak var image: IncidentLocationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.setFloors([UIImage.init(systemName: "pencil")!, UIImage.init(systemName:"square.and.arrow.down.fill")!])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
