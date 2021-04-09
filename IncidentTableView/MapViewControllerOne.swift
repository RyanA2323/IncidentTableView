//
//  MapViewControllerOne.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 4/8/21.
//

import UIKit

class MapViewControllerOne: UIViewController {
    @IBOutlet var image: UIImageView!
    @IBOutlet var gestures: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        image.addGestureRecognizer(gestures);
    }

    @IBAction func onTouched(_ sender: Any) {
        let recog = sender as! UITapGestureRecognizer;
        print("bich");
        let pos = recog.location(in: image);
        let location = Location(pos: normalize(pos), floor: Int.random(in: 0...1));
        // Give to incident class or smthn instead of print
        print(location.pos);
    }
    
    func normalize(_ location: CGPoint) -> CGPoint {
        let frameSize = image.frame.size;
        let imageSize = image.image!.size;
        let shrinkx = imageSize.width/frameSize.width;
        let shrinky = imageSize.height/frameSize.height;
        var floint: CGPoint;
        if(shrinkx > shrinky) {
            let heightInFrame = imageSize.height/shrinkx;
            let offY = (frameSize.height - heightInFrame) / 2;
            let newY = location.y - offY;
            floint = CGPoint(x: location.x / frameSize.width, y: newY / heightInFrame);
        } else {
            let widthInFrame = imageSize.width/shrinky;
            let offX = (frameSize.width - widthInFrame) / 2;
            let newX = location.x - offX;
            floint = CGPoint(x: newX / widthInFrame, y: location.y / frameSize.height);
        }
        return floint;
    }
}
