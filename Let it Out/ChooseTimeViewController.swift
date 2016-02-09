//
//  ChooseTimeViewController.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/4/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class ChooseTimeViewController: UIViewController {


    var textField : UITextField?  // the text field we are setting on the previous page
    @IBOutlet weak var timePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func save(sender: UIBarButtonItem) {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "hh:mm a "
        textField?.text = formatter.stringFromDate(timePicker.date)
        
        formatter.dateFormat = "HHmm"
        
        dismissViewControllerAnimated(true, completion: nil)
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



