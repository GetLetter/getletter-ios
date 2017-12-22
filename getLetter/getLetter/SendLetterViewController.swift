//
//  SendLetterViewController.swift
//  getLetter
//
//  Created by Corentin Marzin on 20/12/2017.
//  Copyright © 2017 getLetter. All rights reserved.
//

import UIKit
import Firebase

class SendLetterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: send data to firebase
    @IBAction func SendDataToFirabase(_ sender: Any) {
        
        let timestamp = NSDate().timeIntervalSince1970
        Analytics.logEvent("NewLetter", parameters: [
            "User_token": token,
            "Date_time": timestamp as NSObject
            ])
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
