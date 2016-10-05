//
//  ViewController.swift
//  TMContainerSwap
//
//  Created by Travis Ma on 7/30/16.
//  Copyright © 2016 Travis Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    var view1: UIViewController!
    var view2: UIViewController!
    var currentView: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        view1 = self.childViewControllers.last!
        view2 = self.storyboard?.instantiateViewController(withIdentifier: "View2")
        currentView = view1
    }
    
    @IBAction func btnView1Tap(_ sender: AnyObject) {
        if currentView == view2 {
            self.addChildViewController(view1)
            view1.view.frame = containerView.bounds
            moveToNewController(newController: view1)
        }
    }
    
    @IBAction func btnView2Tap(_ sender: AnyObject) {
        if currentView == view1 {
            self.addChildViewController(view2)
            view2.view.frame = containerView.bounds
            moveToNewController(newController: view2)
        }
    }
    
    func moveToNewController(newController : UIViewController){
        currentView.willMove(toParentViewController: nil)
        self.transition(from: currentView, to: newController, duration: 0.2, options: [.transitionCrossDissolve], animations: nil, completion: {
            finished in
            self.currentView.removeFromParentViewController()
            newController.didMove(toParentViewController: self)
            self.currentView = newController
        })
    }
}

