//
//  GraphViewController.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/5/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var events : [Event] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        events = User.currentUser.events
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath)
        
        if let eventCell = cell as? EventTableViewCell {
            eventCell.dateLabel.text = events[indexPath.row].dateString
            eventCell.emojiLabel.text = events[indexPath.row].emotion?.emoji
        }
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let eventVC = segue.destinationViewController as? EventDetailsViewController,
            cell = sender as? UITableViewCell,
            indexPath = self.tableView.indexPathForCell(cell) {
            eventVC.event = events[indexPath.row]
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
