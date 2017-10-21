//
//  PushButton.swift
//  CoreGraphicsPractice
//
//  Created by BAM on 2017-10-20.
//  Copyright © 2017 BAM. All rights reserved.
//

import UIKit

@IBDesignable
class PushButton: UIButton {
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    @IBInspectable var fillColor : UIColor = .green
    @IBInspectable var isAddButton : Bool = true

 
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        //set up the width and height variables for the horizontal stroke
        let plusWidth : CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        //create the path
        let plusPath = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        plusPath.lineWidth = Constants.plusLineWidth
        
        //move the initial point of the path to the start of the horizontal stroke
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        
        //add a point to the path at the end of the stroke
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        
        if isAddButton {
            plusPath.move(to: CGPoint(x: halfWidth, y: halfHeight - halfPlusWidth + Constants.halfPointShift))
            plusPath.addLine(to: CGPoint(x: halfWidth, y: halfHeight + halfPlusWidth + Constants.halfPointShift))
        }
        
        //set the stroke color
        UIColor.white.setStroke()
        
        //draw the stroke
        
        plusPath.stroke()
        
    }

}
