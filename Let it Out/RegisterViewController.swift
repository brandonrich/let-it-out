//
//  RegisterViewController.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/3/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var passwordConfirmInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validateForm() -> Bool {
        let user = usernameInput.text!
        let pwd = passwordInput.text!
        let confirm = passwordConfirmInput.text!
        let emptyInputs = user.isEmpty || pwd.isEmpty || confirm.isEmpty
        
        let  match = (pwd == confirm)
        
        return match && !emptyInputs
        
    }
    
    @IBAction func submit(sender: UIButton) {
        
        if validateForm() {
        
        
            if let name = usernameInput.text,
                password = passwordInput.text {
                MyFirebase.sharedInstance.rootRef.createUser(name, password: password,
                    withValueCompletionBlock: { error, result in
                        
                        if error != nil {
                            // There was an error creating the account
                        } else {
                            let uid = result["uid"] as? String
                            print("Successfully created user account with uid: \(uid)")
                            
                        }
                })
            }
        } else {
            print("Bad inputs")
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