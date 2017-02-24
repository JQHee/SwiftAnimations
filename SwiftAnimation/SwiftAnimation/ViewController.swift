//
//  ViewController.swift
//  SwiftAnimation
//
//  Created by MAC on 2017/2/24.
//  Copyright © 2017年 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var complexLoadingView: UIView!
    
    let ovalShapeLayer: CAShapeLayer = CAShapeLayer()
    let anotherOvalShapeLayer: CAShapeLayer = CAShapeLayer()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator()
        beginSimpleAnimation()
        
        complexLoadingIndicator()
        complexAnimations()
    }
    
    // MARK: - 简单的加载指示器
    func loadingIndicator() {
        ovalShapeLayer.strokeColor = UIColor.white.cgColor
        ovalShapeLayer.fillColor = UIColor.clear.cgColor
        ovalShapeLayer.lineWidth = 7
        let ovalRadius = loadingView.bounds.size.height / 2.0 * 0.8
        ovalShapeLayer.path = UIBezierPath(ovalIn: CGRect(x: loadingView.frame.size.width/2 - ovalRadius, y: loadingView.frame.size.height/2 - ovalRadius, width: ovalRadius * 2, height: ovalRadius * 2)).cgPath
        ovalShapeLayer.strokeEnd = 0.4
        ovalShapeLayer.lineCap = kCALineCapRound
        loadingView.layer.addSublayer(ovalShapeLayer)
    }
    
    func beginSimpleAnimation() {
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.duration = 1.5
        rotate.fromValue = 0
        rotate.toValue = 2 * M_PI
        rotate.repeatCount = HUGE
        rotate.speed = 1
        loadingView.layer.add(rotate, forKey: nil)
        //loadingView.layer.anchorPoint = CGPoint(x: 0, y: 0)
    }
    
    // MARK: - 复杂的加载提示
    func complexLoadingIndicator() {
        anotherOvalShapeLayer.strokeColor = UIColor.white.cgColor
        anotherOvalShapeLayer.fillColor = UIColor.clear.cgColor
        anotherOvalShapeLayer.lineWidth = 3
        
        let anotherOvalRadius = complexLoadingView.frame.size.height/2 * 0.8
        anotherOvalShapeLayer.path = UIBezierPath(ovalIn: CGRect(x: complexLoadingView.frame.size.width/2 - anotherOvalRadius, y: complexLoadingView.frame.size.height/2 - anotherOvalRadius, width: anotherOvalRadius * 2, height: anotherOvalRadius * 2)).cgPath
        anotherOvalShapeLayer.lineCap = kCALineCapRound
        
        complexLoadingView.layer.addSublayer(anotherOvalShapeLayer)
    }
    
    func complexAnimations() {
        let strokeStartAnimate = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimate.fromValue = -0.5
        strokeStartAnimate.toValue = 1
        
        let strokeEndAnimate = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimate.fromValue = 0.0
        strokeEndAnimate.toValue = 1
        
        let strokeAnimateGroup = CAAnimationGroup()
        strokeAnimateGroup.duration = 1.5
        strokeAnimateGroup.repeatCount = HUGE
        strokeAnimateGroup.animations = [strokeStartAnimate, strokeEndAnimate]
        anotherOvalShapeLayer.add(strokeAnimateGroup, forKey: nil)
    }
}

