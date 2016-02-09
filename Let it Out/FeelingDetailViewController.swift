//
//  FeelingDetailViewController.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 1/31/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class FeelingDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var mood : Mood?
    var resuseIdentifier = "emotionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = 100.0
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
            
        if let cell = cell as? EmotionTableViewCell,
        emotion = mood?.emotionAt(indexPath.row) {
            cell.nameLabel?.text = emotion.name
            cell.emojiLabel?.text = emotion.emoji
            return cell
        }
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let whyVC = segue.destinationViewController as? WhyDoYouFeelThisWayViewController,
            cell = sender as? UITableViewCell,
            indexPath = self.tableView.indexPathForCell(cell) {
                let e = Event(mood:mood!, emotion: mood!.emotionAt(indexPath.row),reason:"", detail:"")
                whyVC.event = e
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
