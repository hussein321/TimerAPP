//
//  ViewController.swift
//  Timmer
//
//  Created by hoseen on 2/21/16.
//  Copyright © 2016 hoseen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var counter = 1
    
    var startTime = NSTimeInterval()
    
    var timer : NSTimer = NSTimer()
    var timerArray : NSMutableArray = NSMutableArray() 
    

   
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var StopwatcTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
       tableView.dataSource = self
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var StartOutlet: UIButton!
    
    @IBOutlet weak var StopWatchTime: UILabel!
    @IBAction func StartAction(sender: AnyObject) {
    
        ShowButton(true)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        
        startTime = NSDate.timeIntervalSinceReferenceDate()
        self.timerArray.removeAllObjects()
        tableView.reloadData()
        // StopWatchTime.text = "00:00:00 "
        counter = 1

        

        
        //StopwatcTime.text = "welcome"
        
            }
    
    //func tableview(tableview : UITableView!, numberOfRowsInSection section: Int)->Int
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.timerArray.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel!.text = self.timerArray.objectAtIndex(indexPath.row) as? String
        return cell
        
    }
    
    
    
    @IBOutlet weak var StopOutlet: UIButton!
    
    @IBAction func StopAction(sender: AnyObject) {
        ShowButton(false)
        timer.invalidate()
           }
    
    @IBOutlet weak var ReastOutlet: UIButton!
    
    @IBAction func ReastAction(sender: AnyObject) {
        //ShowButton(false)
        
       // timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        
       // startTime = NSDate.timeIntervalSinceReferenceDate()
        self.timerArray.addObject(" \(counter) -> " + StopWatchTime.text!)
        counter++
        tableView.reloadData()
        

    }
    
    func updateTime()
        
    {
        
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        var elpsedTime : NSTimeInterval = currentTime - startTime
        
        let minutes = UInt8(elpsedTime / 60.0)
        
        elpsedTime -= (NSTimeInterval(minutes)*60)
        
        let secound = UInt8(elpsedTime)
        
        elpsedTime -= NSTimeInterval(secound)
        
        let flaction = UInt8(elpsedTime * 100)
        
        
        
        let strminutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        
        let strsecound = secound > 9 ? String(secound):"0" + String(secound)
        
        let strflaction = flaction > 9 ? String (flaction):"0" + String(flaction)
        
        StopWatchTime.text = "\(strminutes):\(strsecound):\(strflaction)"
        
    }
    
    func ShowButton (CaseButton : Bool)
    {
        if CaseButton {
            StartOutlet.hidden = true
            StopOutlet.hidden = false
            ReastOutlet.hidden = false
        }
        else {
            StartOutlet.hidden = false
            StopOutlet.hidden = true
            ReastOutlet.hidden = true
        }
    }
    

}

