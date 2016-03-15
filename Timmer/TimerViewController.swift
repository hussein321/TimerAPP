//
//  TimerViewController.swift
//  Timmer
//
//  Created by hoseen on 3/2/16.
//  Copyright © 2016 hoseen. All rights reserved.
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController {
    var hus : AVAudioPlayer = AVAudioPlayer()
    
    var counter = 0
    var Timer = NSTimer()
    var timeisrunning = false
    var stopPerssed = false
    var lastvalue = 0
    var stopaudio = false

    @IBOutlet weak var StopWatch: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        StopWatch.text = "\(counter)"
        minLable.text = "\(Int(minSlider.value)) min"
        secLable.text = "\(Int(SecSlider.value)) sec"
        

        // Do any additional setup after loading the view.
    }
    func prepareAudios() {
        
        
        let path = NSBundle.mainBundle().pathForResource("hus", ofType: "mp3")
        do{
            hus = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path!), fileTypeHint: nil)
            hus.prepareToPlay()
        }catch{
            print("eejfhjdgfjdgf")
        }
    }


    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func restButtonPressed(sender: AnyObject) {
        ShowButton(false)
        Timer.invalidate()

        timeisrunning = false
        counter = 0
        StopWatch.text = "\(counter)"
        stopPerssed = false
        StopWatch.backgroundColor = UIColor.whiteColor()
        if stopaudio{
        hus.stop()
        }
        
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        
        Timer.invalidate()
        timeisrunning = false
        ShowButton(false)
        stopPerssed = true
    StopWatch.backgroundColor = UIColor.whiteColor()
    lastvalue = counter
        if stopaudio{
        hus.stop()
        }
        
    }
    
    @IBOutlet weak var minSlider: UISlider! {
        didSet{
            minSlider.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        }
    }

    @IBAction func minSliderpressed(sender: AnyObject) {
        minLable.text = "\(Int(minSlider.value)) min "
    
    }
    
    @IBOutlet weak var SecSlider: UISlider! {
        didSet{
            SecSlider.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        }
    }

    @IBAction func sliderButtonPressed(sender: AnyObject) {
    secLable.text = "\(Int(SecSlider.value)) sec"
        
    }
    
@IBAction func StartTimerButton(sender: AnyObject) {
    if timeisrunning == false {
Timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updatetime", userInfo: nil, repeats: true)
        if stopPerssed {
            counter = lastvalue
        }
        else{
            
            counter = counter + (Int(SecSlider.value)) + (Int(minSlider.value)*60)
        }
    }
    if stopaudio{
        hus.stop()
    }
    stopPerssed = false
    ShowButton(true)
    timeisrunning = true
    StopWatch.backgroundColor = UIColor.whiteColor()


}
func updatetime(){
    counter -= 1
 StopWatch.text = "\(counter)"
    if counter < 0{
        counter=0
        Timer.invalidate()
    
        StopWatch.backgroundColor = UIColor.redColor()
        StopWatch.text = "Time Is Up!!!!!"
        stopPerssed = false
        ShowButton(false)
        timeisrunning = false
        prepareAudios()
        hus.play()
        stopaudio = true
        
    }

}
    @IBOutlet weak var minLable: UILabel!

    @IBOutlet weak var secLable: UILabel!
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    @IBOutlet weak var ResatButton: UIButton!
    
    @IBOutlet weak var StopButtonTimer: UIButton!
    @IBOutlet weak var StartButtonTimer: UIButton!
    
    func ShowButton (CaseButton : Bool)
    {
        if CaseButton {
            StartButtonTimer.hidden = true
            ResatButton.hidden = false
            StopButtonTimer.hidden = false
        }
        else {
            StartButtonTimer.hidden = false
            ResatButton.hidden = true
            StopButtonTimer.hidden = true
        }
    }
    
   

}
