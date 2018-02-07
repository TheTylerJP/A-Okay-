//
//  breatheController.swift
//  A-Okay!
//
//  Created by Tyler Phillips on 2/1/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit

class breatheController: UIViewController {

    
    //UIGradient Color
    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0
    
    //let gradientBlue = UIColor(red: 109/255, green: 178/255, blue: 204/255, alpha: 1).cgColor
    //let gradientGreen = UIColor(red: 154/255, green: 204/255, blue: 157/255, alpha: 1).cgColor
    let gradientBlue = UIColor(red: 154/255, green: 93/255, blue: 204/255, alpha: 1).cgColor
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
        
        //Buttons
        
        let mainButtonTapped = UIButton(type: UIButtonType.system) as UIButton
        mainButtonTapped.frame = CGRect(x: 300, y: 50, width: 35, height: 35)
        mainButtonTapped.tintColor=UIColor .black
        mainButtonTapped.setTitle("...", for: .normal)
        if let image  = UIImage(named: "home-icon.png") {
            mainButtonTapped.setImage(image, for: .normal)
        }
        mainButtonTapped.addTarget(self, action: #selector(mainButtonTapped(_:)), for:.touchUpInside)
        self.view.addSubview(mainButtonTapped)
        
        let startButton = UIButton(frame: CGRect(x: 55, y: 555, width: 260, height: 45))
        startButton.tintColor=UIColor .gray
        startButton.layer.cornerRadius = 10
        startButton.layer.borderWidth = 3
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.setTitle("Start", for: .normal)
        startButton.addTarget(self, action: #selector(startButton(_:)), for:.touchUpInside)
        self.view.addSubview(startButton)
        
        //Labels
        
        let timerLabel = UILabel(frame: CGRect(x: 190, y: 200, width: 200, height: 110))
        timerLabel.center = CGPoint(x: 180, y: 200)
        timerLabel.textAlignment = .center
        timerLabel.textColor = UIColor.white
        timerLabel.font = UIFont(name:"Avenir Next", size: 125.0)
        timerLabel.text = "10"
        self.view.addSubview(timerLabel)
        
        let howtoLabel = UILabel(frame: CGRect(x: 255, y: 350, width: 400, height: 200))
        howtoLabel.center = CGPoint(x: 255, y: 475)
        howtoLabel.textAlignment = .center
        howtoLabel.numberOfLines = 0
        howtoLabel.lineBreakMode = .byWordWrapping
        howtoLabel.textColor = UIColor.white
        howtoLabel.font = UIFont(name:"Avenir Next", size: 25.0)
        howtoLabel.text = "Take a deep breath in for 10 seconds, and breathe out for ten seconds"
        howtoLabel.frame.size.width = 250
        howtoLabel.sizeToFit()
        self.view.addSubview(howtoLabel)
        
    
        // Do any additional setup after loading the view.
}


    
    //Timer Label Function
    
    var timerLabel : UILabel!
    
    
    
    //Button Functions
    
    var startButton : UIButton!
    
    @objc func startButton(_ sender: UIButton!) {
        

        
    }
    
    var mainButtonTapped : UIButton!
    
    @objc func mainButtonTapped(_ sender: UIButton) {
        
        //Segue between ViewControllers
        let vc = MainUIController() //your view controller
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

extension breatheController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradient.colors = gradientSet[currentGradient]
            animateGradient()
        }
    }
    
    
    
}
