//
//  FeelingDetailViewController.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 1/31/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class FeelingDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var mood : Mood?
    var resuseIdentifier = "emotionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mood!.emotionCount()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(resuseIdentifier, forIndexPath: indexPath)
        cell.textLabel!.text = mood?.emotionAt(indexPath.row).name
        // Configure the cell...
        
        return cell
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
