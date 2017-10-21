//
//  CounterView.swift
//  CoreGraphicsPractice
//
//  Created by BAM on 2017-10-20.
//  Copyright © 2017 BAM. All rights reserved.
//

import UIKit

@IBDesignable
class CounterView: UIView {

    private struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth : CGFloat = 5.0
        static let arcWidth : CGFloat = 76
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= Constants.numberOfGlasses {
                //view needs to be refreshed
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = .blue
    @IBInspectable var counterColor: UIColor = .orange
    
    override func draw(_ rect: CGRect) {
        
        //define the center point of the view to rotate arc
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        //calculate the radius based on the max dimension of the view
        let radius : CGFloat = max(bounds.width, bounds.height)
        
        //define the start/end angles for the arc
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        
        //create a path based on the center point, radius, and defined angles
        let path = UIBezierPath(arcCenter: center, radius: radius/2 - Constants.arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        //set the line width / color before stroking the path
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        //Draw the outline
        
        
        //calculate the difference between the 2 angles ensuring positivity
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        
        //calculate the arc for each glass
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        
        //multiply out by actual glasses drunk
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        //draw outer arc
        let outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width / 2 - Constants.halfOfLineWidth, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        
        //draw inner arc
        outlinePath.addArc(withCenter: center, radius: bounds.width/2 - Constants.arcWidth + Constants.halfOfLineWidth, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        
        //close path
        outlinePath.close()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = Constants.lineWidth
        outlinePath.stroke()
        
        
    }
 

}
