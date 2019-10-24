//
//  ViewController.swift
//  DrawingApp
//
//  Created by Mac for Rav on 10/1/19.
//  Copyright © 2019 RayZhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentColor = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    var currentLine:lineStr?
    var lineWidth = CGFloat(1)
    var lineCanvas: lineView!
    var copy: [lineStr] = []
    
    var redSlider = CGFloat(0)
    var greenSlider = CGFloat(0)
    var blueSlider = CGFloat(0)
    
    @IBAction func redS(_ sender: UISlider) {
        redSlider = CGFloat(sender.value)
    }
    @IBAction func greenS(_ sender: UISlider) {
        greenSlider = CGFloat(sender.value)
    }
    @IBAction func blueS(_ sender: UISlider) {
        blueSlider = CGFloat(sender.value)
    }
    
    @IBAction func colorSampler(_ sender: Any) {
        currentColor = UIColor(displayP3Red: redSlider, green: greenSlider, blue: blueSlider, alpha: 1.0)
        currentLine?.color = currentColor
    }
    @IBOutlet weak var photo: UIImageView!
    
    @IBAction func showFlower(_ sender: Any) {
        if(photo.alpha == 1){
            photo.alpha = CGFloat(0)
        }
        else{ photo.alpha = CGFloat(1)}
    }
    @IBAction func redB(_ sender: Any) {
        currentColor = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        currentLine?.color = currentColor
    }
    
    @IBAction func blueB(_ sender: Any) {
        currentColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        currentLine?.color = currentColor
    }
    @IBAction func yellowB(_ sender: Any) {
        currentColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
        currentLine?.color = currentColor
    }
    @IBAction func greenB(_ sender: Any) {
        currentColor = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        currentLine?.color = currentColor
    }
    @IBAction func purpleB(_ sender: Any) {
        currentColor = UIColor(displayP3Red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0)
        currentLine?.color = currentColor
    }
    @IBAction func cyanB(_ sender: Any) {
        currentColor = UIColor(displayP3Red: 0.0, green: 0.5, blue: 0.5, alpha: 1.0)
        currentLine?.color = currentColor
    }
    @IBAction func blackB(_ sender: Any) {
        currentColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        currentLine?.color = currentColor
    }
    

    
    @IBAction func clearScreen(_ sender: Any) {
//        circleCanvas.circles = []
//        circleCanvas.theCircle = nil
        lineCanvas.lines = []
        lineCanvas.theLine = nil
    }
    @IBAction func undoDraw(_ sender: Any) {
        lineCanvas.theLine = nil
        if lineCanvas.lines.count >= 1{
        copy.append(lineCanvas.lines[lineCanvas.lines.count-1])
        lineCanvas.lines.remove(at: lineCanvas.lines.count-1)
        }
    }
    @IBAction func redoDraw(_ sender: Any) {
        if copy.count >= 1{
        lineCanvas.lines.append(copy[copy.count-1])
        copy.remove(at: copy.count-1)
        }
    }
    @IBAction func widthChange(_ sender: UISlider) {
         lineWidth = CGFloat(sender.value)
    }
    
    
    
    
    
    
//    var currentCC = CGPoint.zero
//    var currentCircle: circleStr?
//    var circleCanvas:CircleView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lineCanvas = lineView(frame:CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height-130))
        view.addSubview(lineCanvas!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else {return}
//        currentCC = touchPoint
//        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        currentCircle = circleStr( radius: 0, center: touchPoint)
//        let myRect = CGRect(x: touchPoint.x, y: touchPoint.y, width: 80, height: 80)
//        let myCircle = CircleView(frame: myRect)
//        view.addSubview(currentCircle!)
        currentLine = lineStr(color: currentColor, width: lineWidth, points: [touchPoint])
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else {return}
//        let distance = sqrt(pow(touchPoint.y-currentCC.y, 2)+pow(touchPoint.x-currentCC.x, 2))
//        let distance = Function.distance(a: touchPoint, b: (currentCircle?.center)!)
//        currentCircle?.radius = distance
//        currentCircle?.updateCircle(center: currentCC, radius: distance)
//        circleCanvas.theCircle = currentCircle
        currentLine?.points.append(touchPoint)
        lineCanvas.theLine = currentLine
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if tapped {
//            currentLine?.points.append(touchPoint)
//            lineCanvas.theLine = currentLine
//            return
//        }
        if let newLine = currentLine{
//            circleCanvas.circles.append(newCircle)
            lineCanvas.lines.append(newLine)
        }
        currentLine = nil
    }


}

