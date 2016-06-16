//
//  ViewController.swift
//  UIAnimationTutorial
//
//  Created by Jason Newell on 6/15/16.
//  Copyright © 2016 Lumarow. All rights reserved.
//

import UIKit
import CoreGraphics // For a few simple 2D transforms. Use Core Animation if you want to do fancy, fast 3D.

class ViewController: UIViewController {
    @IBOutlet weak var animatedView: UIView!
    
    var angerAnimator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareAnger()
        prepareForGentleTreatment()
        self.angerAnimator.startAnimation()
    }

    func prepareAnger() {
        // I'm using the trailing closure syntax here. The block is passed through the 'animations' param.
        angerAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .linear) { // Linear: the most boring curve. Let the anger rise steadily.
            [unowned self] in // It's safe to grab an unowned reference to 'self' because this is the app's main view which should never go away.
            self.animatedView.backgroundColor = UIColor.black() // Turn to a darker shade of red until all color is drained.
        }

        angerAnimator.addCompletion {
            [unowned self] (position) in
            if position == .end { // Can it get any angrier?
                self.die() // It's too late now.
            }
        }
    }
    
    func die() {
        let deathAnimator: UIViewPropertyAnimator! = UIViewPropertyAnimator(duration: 2.0, curve: .easeIn) {
            [unowned self] in
            // Keel over
            let rotate: CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat.pi); // Head-first landing - ouch (CG == Core Graphics)
            // Fall down
            let translate: CGAffineTransform = CGAffineTransform(translationX: -200, y: -2000) // Long way down
            // Fall away
            let scale: CGAffineTransform = CGAffineTransform(scaleX: 0.1, y: 0.1) // Poor man's depth-of-field simulation
            // Combine the transforms, and apply them to our protagonist
            self.animatedView.transform = scale.concat(translate).concat(rotate)
        }
        
        deathAnimator.addCompletion {
            [unowned self] (position) in
            let admonishment = UIAlertController(title: "Failure", message: "Not great. Now you have to restart.\n(the app)", preferredStyle: .alert)
            self.present(admonishment, animated: true, completion: nil)
        }
        
        deathAnimator.startAnimation()
    }

    @IBAction func goodStroke(_ sender: UISwipeGestureRecognizer) {
    }
    
    @IBAction func badStroke(_ sender: UISwipeGestureRecognizer) {
    }

}

