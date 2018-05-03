//
//  MediumViewController.swift
//  json
//
//  Created by Dorsey, Sidney G on 5/3/18.
//  Copyright © 2018 Dorsey, Sidney G. All rights reserved.
//

import UIKit

class MediumViewController: UIViewController, UITextFieldDelegate {
    
    var timer = Timer()
    var counter:Int = 45
    var isTimerRunning:Bool = false //This will be used to make sure only one timer is created at a time.
    
    var random1a:Int = Int(arc4random_uniform(20) + 5)
    var random1b:Int = Int(arc4random_uniform(20) + 2)
    var random2a:Int = Int(arc4random_uniform(30) + 15)
    var random2b:Int = Int(arc4random_uniform(15)+1)
    var random3a:Int = Int(arc4random_uniform(25) + 2)
    var random3b:Int = Int(arc4random_uniform(25) + 2)
    var random4a:Int = Int(arc4random_uniform(30) + 15)
    var random4b:Int = Int(arc4random_uniform(14)+1)
    var random5a:Int = Int(arc4random_uniform(30) + 2)
    var random5b:Int = Int(arc4random_uniform(36) + 2)
    var random6a:Int = Int(arc4random_uniform(50) + 25)
    var random6b:Int = Int(arc4random_uniform(24)+1)
    
    var answer1m:Int = 0
    var answer2m:Int = 0
    var answer3m:Int = 0
    var answer4m:Int = 0
    var answer5m:Int = 0
    var answer6m:Int = 0
    var med1:Int = 0
    var med2:Int = 0
    var med3:Int = 0
    var med4:Int = 0
    var med5:Int = 0
    var med6:Int = 0
    
    @IBOutlet weak var oneA: UILabel!
    @IBOutlet weak var oneB: UILabel!
    @IBOutlet weak var twoA: UILabel!
    @IBOutlet weak var twoB: UILabel!
    @IBOutlet weak var threeA: UILabel!
    @IBOutlet weak var threeB: UILabel!
    @IBOutlet weak var fourA: UILabel!
    @IBOutlet weak var fourB: UILabel!
    @IBOutlet weak var fiveA: UILabel!
    @IBOutlet weak var fiveB: UILabel!
    @IBOutlet weak var sixA: UILabel!
    @IBOutlet weak var sixB: UILabel!
    
    @IBAction func medBegin(_ sender: Any) {
        if isTimerRunning == false {
            runTimer()
        }
        oneA.text = "\(random1a)"
        oneB.text = "\(random1b)"
        
        twoA.text = "\(random2a)"
        twoB.text = "\(random2b)"
        
        threeA.text = "\(random3a)"
        threeB.text = "\(random3b)"
        
        fourA.text = "\(random4a)"
        fourB.text = "\(random4b)"
        
        fiveA.text = "\(random5a)"
        fiveB.text = "\(random5b)"
        
        sixA.text = "\(random6a)"
        sixB.text = "\(random6b)"
    }
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var answer1: UITextField!
    @IBOutlet weak var answer2: UITextField!
    @IBOutlet weak var answer3: UITextField!
    @IBOutlet weak var answer4: UITextField!
    @IBOutlet weak var answer5: UITextField!
    @IBOutlet weak var answer6: UITextField!
    
    
    @IBAction func mySubmit(_ sender: Any) {
        let answer1e:Int? = Int(answer1.text!)
        if (answer1e == random1a + random1b){
            med1 = 10
        }
        let answer2e:Int? = Int(answer2.text!)
        if (answer2e == random2a - random2b){
            med2 = 10
        }
        let answer3e:Int? = Int(answer3.text!)
        if (answer3e == random3a + random3b){
            med3 = 10
        }
        let answer4e:Int? = Int(answer4.text!)
        if (answer4e == random4a - random4b){
            med4 = 10
        }
        let answer5e:Int? = Int(answer5.text!)
        if (answer5e == random5a + random5b){
            med5 = 10
        }
        let answer6e:Int? = Int(answer6.text!)
        if (answer6e == random6a - random6b){
            med6 = 10
        }
        global.mediumBase = med1 + med2 + med3 + med4 + med5 + med6
        global.mediumBonus = counter
        global.mediumTotal = global.mediumBase + global.mediumBonus
        medTimer.isHidden = true
        youFinished.isHidden = false
        thumbUP.isHidden = false
    }
    
    
    
    
    @IBOutlet weak var youFinished: UILabel!
    @IBOutlet weak var thumbUP: UIImageView!
    @IBOutlet weak var thumbDOWN: UIImageView!
    @IBOutlet weak var tooLong: UILabel!
    @IBOutlet weak var medTimer: UILabel!
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(EasyViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    

    @objc func updateTimer() {
        counter -= 1
        medTimer.text = "\(counter)"
        if(counter == 0) {
            medTimer.text = "Time's Up!"
            timer.invalidate()
            submitButton.isHidden = true
            tooLong.isHidden = false
            thumbDOWN.isHidden = false
        }
    }
    
    @IBAction func myReset(_ sender: Any) {
        global.mediumBase = 0
        global.mediumBonus = 0
        global.mediumTotal = 0
        timer.invalidate()
        counter = 30
        medTimer.text = "\(counter)"
        isTimerRunning = false
        submitButton.isHidden = false
        oneA.text = "_"
        oneB.text = "_"
        twoA.text = "_"
        twoB.text = "_"
        threeA.text = "_"
        threeB.text = "_"
        fourA.text = "_"
        fourB.text = "_"
        fiveA.text = "_"
        fiveB.text = "_"
        sixA.text = "_"
        sixB.text = "_"
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.answer1.delegate = self;
        self.answer2.delegate = self;
        self.answer3.delegate = self;
        self.answer4.delegate = self;
        self.answer5.delegate = self;
        self.answer6.delegate = self;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
