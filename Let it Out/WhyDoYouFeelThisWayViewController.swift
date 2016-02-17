//
//  WhyDoYouFeelThisWayViewController.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/4/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class WhyDoYouFeelThisWayViewController: UIViewController, UITableViewDataSource {

    var event : Event?
    @IBOutlet weak var tableView: UITableView!
    var reasons : [String] = ["Your own thoughts/actions","Another's words or actions", "Uncontrollable occurrence", "Chain of Events"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(event!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reasons.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reasonCell", forIndexPath: indexPath)
        cell.textLabel?.text = reasons[indexPath.row]
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let whatHappenedVC = segue.destinationViewController as? WhatHappenedViewController,
            cell = sender as? UITableViewCell,
            indexPath = self.tableView.indexPathForCell(cell) {
                event?.reason = reasons[indexPath.row]
                whatHappenedVC.event = event
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "WhyToWhatSegue",
            let indexPath = self.tableView.indexPathForSelectedRow {
                let anothersWordsCellClicked = (indexPath.row == 1)
                if(anothersWordsCellClicked) {
                    self.performSegueWithIdentifier("WhyToWhoSegue", sender: nil)
                    return false
                }
        }
        return true
    }

}
