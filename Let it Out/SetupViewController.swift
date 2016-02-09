//
//  SetupViewController.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/4/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var wakeUpInput: UITextField!
    @IBOutlet weak var sleepInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameInput.text = User.currentUser.name ?? ""
        wakeUpInput.text = User.currentUser.wakeUpTime ?? ""
        sleepInput.text = User.currentUser.sleepTime ?? ""
        // Do any additional setup after loading the view.
    }

    @IBAction func save(sender: UIButton) {
        User.currentUser.name = nameInput.text
        User.currentUser.wakeUpTime = wakeUpInput.text!
        User.currentUser.sleepTime = sleepInput.text!
        User.currentUser.persist()
        print(User.currentUser)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let remoteVC = segue.destinationViewController as? ChooseTimeViewController,
        textField = sender as? UITextField {
            remoteVC.textField = textField
        }
    }

    @IBAction func wakeUpClicked(sender: UITextField) {
        performSegueWithIdentifier("wakeup", sender: sender)
    }
    @IBAction func sleepClicked(sender: UITextField) {
        performSegueWithIdentifier("sleep", sender: sender)
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
