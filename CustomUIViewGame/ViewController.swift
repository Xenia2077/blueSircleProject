//
//  ViewController.swift
//  CustomUIViewGame
//
//  Created by Ксения Борисова on 10.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstCircle: BlueCircleView!
    @IBOutlet weak var secondCircle: BlueCircleView!
    @IBOutlet weak var thirdCircle: BlueCircleView!
    @IBOutlet weak var fourthCircle: BlueCircleView!
    @IBOutlet weak var fifthCircle: BlueCircleView!
    @IBOutlet weak var sixthCircle: BlueCircleView!
    @IBOutlet weak var seventhCircle: BlueCircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func panAction(_ gesture: UIPanGestureRecognizer) {
        gestureRecognizer(gesture: gesture)
    }
    
    
    private func gestureRecognizer(gesture: UIPanGestureRecognizer) {
        guard let gestureView = gesture.view else { return }
        
        let gestureTranslation = gesture.translation(in: view)
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        
        gesture.setTranslation(.zero, in: view)
        
        guard gesture.state == .ended else { return }
        
        for circle in [firstCircle, secondCircle, thirdCircle, fourthCircle, fifthCircle, sixthCircle, seventhCircle] {
            if let circleView = circle, intersectViews(view1: gestureView, view2: circleView) {
                circleView.isHidden = true
                transform(view: gestureView)
            }
        }
        
    }
    
    private func intersectViews(view1: UIView, view2: UIView) -> Bool {
        guard view1.isHidden == false, view2.isHidden == false else {
            return false
        }
        guard !view1.isEqual(view2) else {
            return false
        }
        return view1.frame.intersects(view2.frame)
    }
    
    private func transform(view: UIView) {
        view.layer.backgroundColor = CGColor(red: 0.2, green: 0, blue: 1, alpha: 1)
        view.transform = view.transform.scaledBy(x: 1.1, y: 1.1)
    }
    
}

