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
}
