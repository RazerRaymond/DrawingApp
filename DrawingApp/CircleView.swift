//
//  CircleView.swift
//  DrawingApp
//
//  Created by Mac for Rav on 10/1/19.
//  Copyright © 2019 RayZhang. All rights reserved.
//

import UIKit

class CircleView: UIView {

    
    var theCircle:circleStr?{
        didSet{
            setNeedsDisplay()
        }
    }
    var circles:[circleStr] = []{
        didSet{
            setNeedsDisplay()
        }
    }
//    var arcCenter = CGPoint.zero
//    var arcRadius = CGFloat()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.*/
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCircle(center: CGPoint, radius: CGFloat){
//        arcCenter = center
//        arcRadius = radius
        setNeedsDisplay()
    }
    override func draw(_ rect: CGRect) {
        // Drawing code
//        UIColor.green.setFill()
//
//        let path = UIBezierPath()
//        path.addArc(withCenter: arcCenter, radius: arcRadius, startAngle: 0, endAngle: CGFloat(Float.pi*2), clockwise: true)
//        path.fill()
        for circle in circles{
            drawCircle(circle)
        }
        
        if(theCircle != nil){
            drawCircle(theCircle!)
        }
    }
    
    func drawCircle(_ circleV: circleStr){
        UIColor.green.setFill()
        let path = UIBezierPath()
        path.addArc(withCenter: circleV.center, radius: circleV.radius, startAngle: 0, endAngle: CGFloat(Float.pi*2), clockwise: true)
        path.fill()
    }

}
