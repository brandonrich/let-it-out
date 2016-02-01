//
//  HowAreYouFeelingViewController.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 1/31/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

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
        if let detailVC = segue.destinationViewController as? FeelingDetailViewController,
            cell = sender as? UITableViewCell,
            indexPath = self.tableView.indexPathForCell(cell) {
                detailVC.mood = spectrum.moods[indexPath.row]
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