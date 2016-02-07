//
//  WhatHappenedViewController.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/7/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class WhatHappenedViewController: UIViewController {

    @IBOutlet weak var textInput: UITextView!
    var event : Event?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(event!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submit(sender: AnyObject) {
        event?.detail = textInput.text
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
