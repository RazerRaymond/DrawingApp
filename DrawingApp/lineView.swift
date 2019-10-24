//
//  lineView.swift
//  DrawingApp
//
//  Created by Mac for Rav on 10/1/19.
//  Copyright © 2019 RayZhang. All rights reserved.
//

import UIKit

class lineView: UIView {
    
    var theLine:lineStr?{
        didSet{
            setNeedsDisplay()
        }
    }
    var lines:[lineStr] = []{
        didSet{
            setNeedsDisplay()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        for line in lines{
            drawLine(line)
        }
        
        if(theLine != nil){
            drawLine(theLine!)
        }
    
    }
    
    func drawLine(_ line: lineStr){
//        line.color.setFill()
//        let path = createQuadPath(points: line.points)
//        path.lineWidth = line.width
//        line.color.setStroke()
//        path.stroke()
        let path = createQuadPath(points: line.points)
        let dot: CGPoint = line.points[0]
        if(line.points.count == 1){
            path.addArc(withCenter: dot, radius: line.width*1.25, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
            line.color.setFill()
            path.fill()
        }
        else{
            path.lineWidth = line.width
            line.color.setStroke()
            path.stroke()
        }

    }
    
    
    
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
            // implement this function here
        let res = CGPoint(x: Float64((first.x+second.x)/2.0),y: Float64((first.y+second.y)/2.0))
        return res
    }
    
    private func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath() //Create the path object
        path.lineCapStyle = .round
        if(points.count < 2){ //There are no points to add to this path
            return path
    }
        path.move(to: points[0]) //Start the path on the first point
        for i in 1..<points.count - 1{
            let firstMidpoint = midpoint(first: path.currentPoint, second: points[i])
                //Get midpoint between the path's last point and the next one in the array
//            let secondMidpoint = midpoint(first: points[i], second: points[i+1])
                //Get midpoint between the next point in the array and the one after it
            path.addQuadCurve(to: points[i], controlPoint: firstMidpoint)
                //This creates a cubic Bezier curve using math!
            path.move(to: points[i])
    
        }
        return path
    }
}
