//
//  LoginViewController.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/3/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, ActionResultResponder {

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var successLabel: UILabel!
    
    var success : Bool = false
    var message : String = ""


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        if ( success ) {
            successLabel.text = message
        } else {
            successLabel.text = ""
        }
        success = false
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "loginSegue" {
            authenticate()
            return false
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let registrationVC = segue.destinationViewController as? RegisterViewController {
            registrationVC.caller = self
        }
    }
    

    
    func authenticate() {
        let user = usernameInput.text!
        let pass = passwordInput.text!
        MyFirebase.sharedInstance.rootRef.authUser(user, password: pass) {
            error, authData in
            if error != nil {
                // an error occured while attempting login
                print("problem logging in")
            } else {
                // user is logged in, check authData for data
                self.performSegueWithIdentifier("loginSuccessSegue", sender: nil)
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
