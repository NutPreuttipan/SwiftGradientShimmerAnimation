//
//  FacebookGradientLoadingViewController.swift
//  SwiftGradientAnimation
//
//  Created by Preuttipan Janpen on 8/5/2562 BE.
//  Copyright © 2562 Lphant Solutions. All rights reserved.
//

import UIKit


class FacebookGradientLoadingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelImage: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    
}

class FacebookGradientLoadingViewController: UIViewController {

    @IBOutlet weak var tableViewList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear]
        gradientLayer.locations = [0,0.5,1]
        gradientLayer.frame = CGRect(x: 0, y: self.view.frame.minY - 150, width: view.frame.width, height: tableViewList.frame.height + 350)
        let angle = 35 * (CGFloat.pi / 180)
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)

        tableViewList.layer.mask = gradientLayer

        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.fromValue = -view.frame.width - 200
        animation.toValue = view.frame.width + 300
        animation.repeatCount = Float.infinity
        gradientLayer.add(animation, forKey: "a")
    }

}

extension FacebookGradientLoadingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewList.dequeueReusableCell(withIdentifier: "cellList", for: indexPath) as! FacebookGradientLoadingTableViewCell
        
        gradientAnimation(object: cell)
        
        return cell
    }
    
    func gradientAnimation(object: AnyObject) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = object.bounds//CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let angle = 45 * (CGFloat.pi / 180)
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        object.layer?.mask = gradientLayer
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width + 20
        animation.repeatCount = Float.infinity
        gradientLayer.add(animation, forKey: "a")
    }
    
}
