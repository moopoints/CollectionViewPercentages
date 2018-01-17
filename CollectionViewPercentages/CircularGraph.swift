//
//  CircularGraph.swift
//  CollectionViewPercentages
//
//  Created by Jan Senderek on 1/17/18.
//  Copyright © 2018 Jan Senderek. All rights reserved.
//

import UIKit

class CircularGraph: UIView {
    
    //All layers
    let trackLayer = CAShapeLayer()
    let progressLayer = CAShapeLayer()
    
    //Animation values
    var percentageValue = CGFloat()
    
    //Line width
    var lineWidth:   CGFloat = 15                              { didSet { updatePath() } }
    
    //Fill colors
    var trackLayerFillColor:   UIColor = .clear                { didSet { trackLayer.fillColor = trackLayerFillColor.cgColor } }
    var progressLayerFillColor:   UIColor = .clear             { didSet { progressLayer.fillColor = progressLayerFillColor.cgColor } }
    
    //Stroke colors
    var trackStrokeColor: UIColor = UIColor.lightGray          { didSet { trackLayer.strokeColor = trackStrokeColor.cgColor  } }
    var progressLayerStrokeColor: UIColor = UIColor.green      { didSet { progressLayer.strokeColor = progressLayerStrokeColor.cgColor  } }
    
    //Stroke start and end
    var trackLayerStrokeStart: CGFloat = 0                     { didSet { trackLayer.strokeStart = trackLayerStrokeStart } }
    var progressLayerStrokeStart: CGFloat = 0                  { didSet { progressLayer.strokeStart = progressLayerStrokeStart } }
    
    var trackLayerStrokeEnd:   CGFloat = 1                     { didSet { trackLayer.strokeEnd = trackLayerStrokeEnd } }
    
    
    var progressLayerStrokeEnd: CGFloat = 1 {
        didSet {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            progressLayer.strokeEnd = progressLayerStrokeEnd
            CATransaction.commit()
        }
    }
    
    
    
    
    //INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    //REQUIRED INIT
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    
    //LAYOUT SUBVIEWS
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePath()
    }
    
    
    //CONFIGURE
    func configure() {
        trackLayer.strokeColor = trackStrokeColor.cgColor
        trackLayer.fillColor = trackLayerFillColor.cgColor
        trackLayer.strokeStart = trackLayerStrokeStart
        trackLayer.strokeEnd  = trackLayerStrokeEnd
        
        progressLayer.strokeColor = progressLayerStrokeColor.cgColor
        progressLayer.fillColor = progressLayerFillColor.cgColor
        progressLayer.strokeStart = progressLayerStrokeStart
        progressLayer.strokeEnd  = progressLayerStrokeEnd
        
        layer.addSublayer(trackLayer)
        layer.addSublayer(progressLayer)
    }
    
    //UPDATE PATH
    func updatePath() {
        //The actual calculation for the circular graph
        let arcCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
        let circularPath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.lineWidth = lineWidth
        
        progressLayer.path = circularPath.cgPath
        progressLayer.lineWidth = lineWidth
        progressLayer.lineCap = kCALineCapRound
        
        //Set the frame in order to rotate the outer circular paths to start at 12 o'clock
        trackLayer.transform = CATransform3DIdentity
        trackLayer.frame = bounds
        trackLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        
        progressLayer.transform = CATransform3DIdentity
        progressLayer.frame = bounds
        progressLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
    }
}
