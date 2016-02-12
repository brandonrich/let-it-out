//
//  HowAreYouFeelingViewController.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 1/31/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit
import Firebase

class HowAreYouFeelingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var spectrum = EmotionalSpectrum()
    let reuseIdentifier = "moodCell"
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.textLabel!.text = spectrum.moods[indexPath.row].name
        // Configure the cell...
        
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "HowToFeelingSegue",
            let detailVC = segue.destinationViewController as? FeelingDetailViewController,
            indexPath = self.tableView.indexPathForSelectedRow {
                detailVC.mood = spectrum.moods[indexPath.row]
        } else if segue.identifier == "HowToWhySegue" {
            let whyVC = segue.destinationViewController as? WhyDoYouFeelThisWayViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            let mood = spectrum.moods[indexPath!.row]
            let e = Event(mood:mood, emotion: Emotion(name: "Neutral", value: 0, emoji: ""),reason:"", detail:"")
            whyVC!.event = e
        }
    }
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "HowToFeelingSegue" {
            let indexPath = self.tableView.indexPathForSelectedRow
            let mood = spectrum.moods[indexPath!.row]
            if mood.emotionCount() == 0 {
                self.performSegueWithIdentifier("HowToWhySegue", sender: nil)
                return false
            }
        }
        return true
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
