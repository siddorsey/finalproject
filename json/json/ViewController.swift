//
//  ViewController.swift
//  json
//
//  Created by Dorsey, Sidney G on 4/18/18.
//  Copyright © 2018 Dorsey, Sidney G. All rights reserved.
//

import UIKit



class Global {
    var easyBase = Int()
    var easyBonus = Int()
    var easyTotal = Int()
    
    var mediumBase = Int()
    var mediumBonus = Int()
    var mediumTotal = Int()
    
    var hardBase = Int()
    var hardBonus = Int()
    var hardTotal = Int()
}

let global = Global()



struct Diff: Decodable {
    let id: Int
    let name: String
    let description: String
}



class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var selection: String!

    
    
    @IBOutlet weak var picker: UIPickerView!
    let items = ["Select a Difficulty", "Easy", "Medium", "Hard"]
   
    @IBOutlet weak var theEvents: UITextView!
    
    //establishes the number of components (columns)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //establishes the number of rows in the json
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    //establishes selection of each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    //this is the function that runs when you select a row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selection = items[row]
        let diffSelect = selection!
        //theEvents.text! = "You picked \(diffSelect):\n"
        
        // url for json file. Must be https and hosted on a secure server. Change the location to your json file on your server
        
        let json = "https://sidneydorsey.com/files/diff.json"
        
        // guard statements protect the app if there is no response
        guard let url = URL(string: json)
            else { return }
        
        // this area sets up a urlsession with the json
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data
                else { return }
            
            // use do, try, catch to deal with errors
            do {
                
                // JSONDecoder decodes json array
                let diff = try JSONDecoder().decode([Diff].self, from: data)
                //enumerated adds the index to the array
                for (i, diff) in diff.enumerated() {
                    if(diff.name == diffSelect) {
                        //must use this to change the ui element outside of the urlsession. Use of += to append to the TextView
                        DispatchQueue.main.sync {
                            self.theEvents.text! = ("\(diff.name) \n\n \(diff.description)")
                        }
                    }
                }
            }
                
            catch let jsonErr {
                print("Error", jsonErr)
            }
            
            }.resume()
        
        
    }
    
    
    @IBOutlet weak var eBase: UILabel!
    @IBOutlet weak var eTime: UILabel!
    @IBOutlet weak var eScore: UILabel!
    
    @IBOutlet weak var mBase: UILabel!
    @IBOutlet weak var mTime: UILabel!
    @IBOutlet weak var mScore: UILabel!
    
    @IBOutlet weak var hBase: UILabel!
    @IBOutlet weak var hTime: UILabel!
    @IBOutlet weak var hScore: UILabel!
    
    
    
    
    

    
    
    
    

    override func viewWillAppear(_ animated: Bool){
        eBase.text = "\(global.easyBase)"
        eTime.text = "\(global.easyBonus)"
        eScore.text = "\(global.easyTotal)"
        
        mBase.text = "\(global.mediumBase)"
        mTime.text = "\(global.mediumBonus)"
        mScore.text = "\(global.mediumTotal)"
        
        hBase.text = "\(global.hardBase)"
        hTime.text = "\(global.hardBonus)"
        hScore.text = "\(global.hardTotal)"
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

