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
    var pointBounds: CGRect? = nil;
    let pointSize: CGFloat = 18;
    
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
        var circleRect = CGRect(origin: off.origin, size: CGSize(width: pointSize, height: pointSize));
        circleRect = circleRect.offsetBy(dx: off.width * pos.x, dy: off.height * pos.y);
        circleRect = circleRect.offsetBy(dx: -pointSize/2, dy: -pointSize/2);
        pointBounds = circleRect;
        
        updateDrawingOverlay()
    }
    
    func setFloor(_ floor: Int) {
        // Subtract 1 to make the input 1-indexed instead of 0-indexed.
        image = floors[floor - 1];
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
    
    public func setFloorImages(_ floors: [UIImage]) {
        self.floors = floors;
    }
}
