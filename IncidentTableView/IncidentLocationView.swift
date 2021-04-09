//
//  IncidentLocationView.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 4/8/21.
//

import Foundation
import UIKit

@IBDesignable
class IncidentLocationView: UIImageView {
    
    var floors: [UIImage] = [];
    let drawingLayer = CAShapeLayer()
    var pointBounds: CGRect? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.addSublayer(drawingLayer)
    }
    
    override func layoutSubviews() {
        updateDrawingOverlay()
    }
    
    public func setLocation(_ location: Location) {
        setFloor(location.floor);
        setPoint(location.pos);
    }
    
    func setPoint(_ pos: CGPoint) {
        let frameSize = self.frame.size;
        let imageSize = self.image!.size;
        let shrinkx = imageSize.width/frameSize.width;
        let shrinky = imageSize.height/frameSize.height;
        var off = self.frame;
        off.origin = CGPoint(x: 0, y: 0)
        if(shrinkx > shrinky) {
            off.size.height = imageSize.height/shrinkx;
            off.origin.y += (frameSize.height - off.height) / 2;
        } else {
            off.size.width = imageSize.width/shrinky;
            off.origin.x += (frameSize.width - off.width) / 2;
        }
        var circleRect = CGRect(origin: off.origin, size: CGSize(width: 10, height: 10));
        circleRect = circleRect.offsetBy(dx: off.width * pos.x, dy: off.height * pos.y);
        circleRect = circleRect.offsetBy(dx: -5, dy: -5);
        pointBounds = circleRect;
        
        updateDrawingOverlay()
    }
    
    func setFloor(_ floor: Int) {
        image = floors[floor];
    }
    
    func updateDrawingOverlay() {
        if((pointBounds) != nil) {
            let path = CGMutablePath();
            path.addEllipse(in: pointBounds!);
            
            drawingLayer.path = path
            drawingLayer.fillColor = UIColor.red.cgColor
            
            setNeedsDisplay()
        }
    }
    
    public func setFloors(_ floors: [UIImage]) {
        self.floors = floors;
    }
}
