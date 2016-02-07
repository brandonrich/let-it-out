//
//  ProfileViewController.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/5/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wakeUpLabel: UILabel!
    @IBOutlet weak var sleepLabel: UILabel!

    override func viewWillAppear(animated: Bool) {
        // Do any additional setup after loading the view.
        nameLabel.text = User.currentUser.name ?? "Not specified"
        wakeUpLabel.text = User.currentUser.wakeUpTime.reformatTimeString("HHmm", toFormat: "hh:mm a") ?? "Not specified"
        sleepLabel.text = User.currentUser.sleepTime.reformatTimeString("HHmm", toFormat: "hh:mm a") ?? "Not specified"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
