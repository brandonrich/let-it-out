//
//  WhoMadeYouFeelThisWayViewController.swift
//  Let it Out
//
//  Created by David Mattia on 2/17/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class WhoMadeYouFeelThisWayViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var whatDidTheyDoTextField: UITextField!
    @IBOutlet weak var textInput: UITextView!
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submit(sender: AnyObject) {
        event?.detail = self.nameTextField.text! + " : " + self.whatDidTheyDoTextField.text! + " : " + textInput.text
        User.currentUser.addEvent(event!)
        goBackToStart()
    }
    
    func goBackToStart() {
        let allViewControllers = self.navigationController?.viewControllers
        for aViewController in allViewControllers! {
            if aViewController.isKindOfClass(HowAreYouFeelingViewController) {
                self.navigationController?.popToViewController(aViewController, animated:true)
            }
        }
    }
}
