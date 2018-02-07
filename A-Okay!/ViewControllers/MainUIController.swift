//
//  MainUIController.swift
//  A-Okay!
//
//  Created by Tyler Phillips on 2/1/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit

class MainUIController: UIViewController {
    
    
    
    //UIGradient Color
    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0
    
    //let gradientBlue = UIColor(red: 109/255, green: 178/255, blue: 204/255, alpha: 1).cgColor
    //let gradientGreen = UIColor(red: 154/255, green: 204/255, blue: 157/255, alpha: 1).cgColor
    let gradientBlue = UIColor(red: 194/255, green: 116/255, blue: 204/255, alpha: 1).cgColor
    let gradientGreen = UIColor(red: 154/255, green: 93/255, blue: 204/255, alpha: 1).cgColor
    let gradientPurple = UIColor(red: 154/255, green: 93/255, blue: 204/255, alpha: 1).cgColor

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //UIGradient
        gradientSet.append([gradientBlue, gradientGreen])
        gradientSet.append([gradientGreen, gradientPurple])
        gradientSet.append([gradientPurple, gradientBlue])
        
        
        gradient.frame = self.view.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        gradient.drawsAsynchronously = true
        self.view.layer.addSublayer(gradient)
        
        animateGradient()
        
        
        
        
        
        let welcomeLabel = UILabel()
        welcomeLabel.center = CGPoint(x: 245, y: 475)
        welcomeLabel.textAlignment = .center
        welcomeLabel.numberOfLines = 0
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.textColor = UIColor.white
        welcomeLabel.font = UIFont(name:"Avenir Next", size: 35.0)
        welcomeLabel.text = "Tyler is a 24 yearold iOS developer!"
        welcomeLabel.frame.size.width = 300
        welcomeLabel.sizeToFit()
        self.view.addSubview(welcomeLabel)
        
        
        
        
        
        
        
        
        
        //Labels
        
        let breatheLabel = UILabel(frame: CGRect(x: 190, y: 325, width: 200, height: 200))
        breatheLabel.center = CGPoint(x: 185, y: 325)
        breatheLabel.textAlignment = .center
        breatheLabel.textColor = UIColor.white
        breatheLabel.font = UIFont(name:"Avenir Next", size: 35.0)
        breatheLabel.text = "Just Breathe"
        self.view.addSubview(breatheLabel)
        
        let okayLabel = UILabel(frame: CGRect(x: 245, y: 375, width: 400, height: 200))
        okayLabel.center = CGPoint(x: 245, y: 475)
        okayLabel.textAlignment = .center
        okayLabel.numberOfLines = 0
        okayLabel.lineBreakMode = .byWordWrapping
        okayLabel.textColor = UIColor.white
        okayLabel.font = UIFont(name:"Avenir Next", size: 35.0)
        okayLabel.text = "Everything will be A-Okay!"
        okayLabel.frame.size.width = 300
        okayLabel.sizeToFit()
        self.view.addSubview(okayLabel)
        
        
        //UIImageViews
        
        let imageName = "smile-face.png"
        let image = UIImage(named: imageName)
        let albumView = UIImageView(image: image!)
        
        albumView.frame = CGRect(x: 145, y: 150, width: 75, height: 75)
        view.addSubview(albumView)
        
        //Buttons
        
        let randomButton = UIButton(frame: CGRect(x: 55, y: 555, width: 260, height: 45))
        randomButton.tintColor=UIColor .gray
        randomButton.layer.cornerRadius = 10
        randomButton.layer.borderWidth = 3
        randomButton.layer.borderColor = UIColor.white.cgColor
        randomButton.setTitle("Calm", for: .normal)
        randomButton.addTarget(self, action: #selector(randomButton(_:)), for:.touchUpInside)
        self.view.addSubview(randomButton)
        
    
    // Do any additional setup after loading the view.
    }

    var randomButton : UIButton!
    
    @objc func randomButton(_ sender: UIButton!) {
        
        //Segue between ViewControllers
        let vc = breatheController() //your view controller
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    //UIColor Gradient Func
    
    func animateGradient() {
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 7.00
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = kCAFillModeForwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
    }
    
}

    //Extensions

    extension MainUIController: CAAnimationDelegate {
        func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
            if flag {
                gradient.colors = gradientSet[currentGradient]
                animateGradient()
            }
        }
        
        
}
