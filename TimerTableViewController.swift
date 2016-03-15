//
//  TimerTableViewController.swift
//  Timmer
//
//  Created by hoseen on 3/2/16.
//  Copyright © 2016 hoseen. All rights reserved.
//

import UIKit

class TimerTableViewController: UITableViewController {
    var counter = 1
    var Timer = NSTimer()
    
    @IBOutlet weak var StopWatch: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }
    
   /* @IBAction func StartTimerButton(sender: AnyObject) {
        
        Timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updatetime", userInfo: nil, repeats: true)
        
        
    }
    func updatetime(){
       counter += 1
       // StopWatch.text = "\(counter)"
    }
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
