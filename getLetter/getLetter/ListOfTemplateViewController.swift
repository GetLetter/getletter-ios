//
//  ListOfTemplateViewController.swift
//  getLetter
//
//  Created by Corentin Marzin on 21/12/2017.
//  Copyright © 2017 getLetter. All rights reserved.
//

import UIKit

class ListOfTemplateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("token", token)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func BackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
