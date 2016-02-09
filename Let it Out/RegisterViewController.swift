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
    var caller : ActionResultResponder?
    
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
                            
                            User.setCurrentUser(uid!)
                            
                            self.caller?.success = true
                            self.caller?.message = "Registration Successful!"
                            self.navigationController?.popViewControllerAnimated(true)
                            
                        }
                })
            }
        } else {
            print("Bad inputs")
        }
    }


}

protocol ActionResultResponder {
    var success : Bool {get set}
    var message : String {get set}
}
