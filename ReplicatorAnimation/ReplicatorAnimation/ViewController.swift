//
//  ViewController.swift
//  ReplicatorAnimation
//
//  Created by MAC on 2017/2/25.
//  Copyright © 2017年 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var replicatorAnimationView: UIView!

    @IBOutlet weak var activityIndicatorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstReplicatorAnimation()
        activityIndicatorAnimation()
    }
    /*CAReplicatorLayer是一个新面孔，它也是CALayer的子类，正如它的名称一样，CAReplicatorLayer可以对它自己的子Layer进行复制操作。
     */
    // MARK: - 正在播放音乐或广播动画
    func firstReplicatorAnimation() {
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.bounds = CGRect(x: replicatorAnimationView.frame.origin.x, y: replicatorAnimationView.frame.origin.y, width: replicatorAnimationView.frame.size.width, height: replicatorAnimationView.frame.size.height)
        replicatorLayer.anchorPoint = CGPoint(x: 0, y: 0)
        replicatorLayer.backgroundColor = UIColor.clear.cgColor
        replicatorLayer.instanceCount = 3 // 设置三份
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(40, 0, 0) // 设置间隔
        replicatorLayer.instanceDelay = 0.3
        replicatorLayer.masksToBounds = true

        replicatorAnimationView.layer.addSublayer(replicatorLayer)
        
        
        let rectangle = CALayer()
        rectangle.bounds = CGRect(x: 0, y: 0, width: 30, height: 90)
        rectangle.anchorPoint = CGPoint(x: 0, y: 0)
        rectangle.position = CGPoint(x: replicatorAnimationView.frame.origin.x + 10, y: replicatorAnimationView.frame.origin.y + 110)
        rectangle.cornerRadius = 2
        rectangle.backgroundColor = UIColor.white.cgColor
        replicatorLayer.addSublayer(rectangle)
        
        let moveRectangle = CABasicAnimation(keyPath: "position.y")
        moveRectangle.toValue = rectangle.position.y - 70
        moveRectangle.duration = 0.7
        moveRectangle.autoreverses = true
        moveRectangle.repeatCount = HUGE
        rectangle.add(moveRectangle, forKey: nil)
    }
    
    func activityIndicatorAnimation() {
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.bounds = CGRect(x: 0, y: 0, width: activityIndicatorView.frame.size.width, height: activityIndicatorView.frame.size.height)
        replicatorLayer.position = CGPoint(x: activityIndicatorView.frame.size.width/2, y: activityIndicatorView.frame.size.height/2)
        replicatorLayer.backgroundColor = UIColor.clear.cgColor
        
        
        replicatorLayer.instanceCount = 15
        let angle = CGFloat(2 * M_PI) / CGFloat(15)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
        replicatorLayer.instanceDelay = 1/15
        activityIndicatorView.layer.addSublayer(replicatorLayer)
        
        
        let circle = CALayer()
        circle.bounds = CGRect(x: 0, y: 0, width: 15, height: 15)
        circle.position = CGPoint(x: activityIndicatorView.frame.size.width/2, y: activityIndicatorView.frame.size.height/2 - 55)
        circle.cornerRadius = 7.5
        circle.backgroundColor = UIColor.white.cgColor
        circle.transform = CATransform3DMakeScale(0.01, 0.01, 0.01)
        replicatorLayer.addSublayer(circle)
        
        
        let scale = CABasicAnimation(keyPath: "transform.scale")
        scale.fromValue = 1
        scale.toValue = 0.1
        scale.duration = 1
        scale.repeatCount = HUGE
        circle.add(scale, forKey: nil)
    }


}

