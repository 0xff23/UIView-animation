//
//  ViewController.swift
//  UIViewAnimation
//
//  Created by Kirill G on 2/19/18.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit

@IBDesignable
class ViewController: UIViewController {
    
    var square = UIView()
    @IBOutlet weak var numberOfSquares: UISlider!
    
    let duration = 1.0
    let delay = TimeInterval(900 + arc4random_uniform(100)) / 1000
    let options = UIViewAnimationOptions.curveEaseIn
    let repeatOption = UIViewAnimationOptions.repeat
    let autoReverse = UIViewAnimationOptions.autoreverse
    let damping:CGFloat = 0.5
    let velocity:CGFloat = 1.0
    let optionsOne = UInt8(UIViewAnimationOptions.autoreverse.rawValue) | UInt8(UIViewAnimationOptions.repeat.rawValue) | UInt8(UIViewAnimationOptions.curveEaseInOut.rawValue)

    override func viewDidLoad() {
        super.viewDidLoad()
        //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bounceAnimation(_ sender: UIButton) {
        createSquare()
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions(rawValue: UIViewAnimationOptions.RawValue(optionsOne)), animations: { [unowned self] in
            self.square.backgroundColor = UIColor.black
            self.square.frame = CGRect(x: 250, y: 120, width: 50, height: 50)
            }, completion: { finished in
                self.square.removeFromSuperview()
        })
        
    }
    
    @IBAction func randomSquare(_ sender: Any) {
        
        let numberOfSquare = Int(self.numberOfSquares.value)
        
        for _ in 0...numberOfSquare {
            
            let size : CGFloat = CGFloat( arc4random_uniform(40))+20
            let yPosition : CGFloat = CGFloat( arc4random_uniform(200))+20
            
            let plane = UIImageView()
            plane.image = UIImage(named: "plane")
            plane.frame = CGRect(x:0-size, y:yPosition, width:size, height:size)
            self.view.addSubview(plane)
            
            UIView.animate(withDuration: duration, delay: delay, options: .curveLinear, animations: {
                plane.frame = CGRect(x:320, y:yPosition, width:size, height:size)
            }, completion: { finished in
                plane.removeFromSuperview()
            })
        }
    }
    
    @IBAction func springAnimation(_ sender: UIButton) {
        createSquare()
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: options, animations: { [unowned self] in
            self.square.backgroundColor = UIColor.black
            self.square.frame = CGRect(x: 250, y: 120, width: 50, height: 50)
            }, completion: { finished in
                self.square.removeFromSuperview()
        })
    }

    @IBAction func animationOne(_ sender: UIButton) {
        createSquare()
        UIView.animate(withDuration: duration, delay: delay, options: autoReverse, animations: { [unowned self] in
            self.square.backgroundColor = UIColor.cyan
            self.square.frame = CGRect(x: 375, y: 120, width: 50, height: 50)
            }, completion: { finished in
                self.square.removeFromSuperview()
        })
    }
    
    func createSquare() {
        square.backgroundColor = UIColor.red
        // Top left position for square
        square.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
        // Add square to the screen
        self.view.addSubview(square)
    }
    
}

