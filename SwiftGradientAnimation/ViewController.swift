//
//  ViewController.swift
//  SwiftGradientAnimation
//
//  Created by Preuttipan Janpen on 8/5/2562 BE.
//  Copyright © 2562 Lphant Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelBack: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelBack.isHidden = true
        label.isHidden = true
        
        view.backgroundColor = UIColor.black
        
        let label1 = UILabel()
        label1.text = "Shimmer"
        label1.textColor = UIColor.red
        label1.font = UIFont.systemFont(ofSize: 80)
        label1.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 95)
        label1.textAlignment = .center
        
        view.addSubview(label1)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        let angle = 45 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
//
//        view.layer.addSublayer(gradientLayer)
        label1.layer.mask = gradientLayer
////        label1.layer.mask = gradientLayer
////
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        gradientLayer.add(animation, forKey: "a")
    }


}

