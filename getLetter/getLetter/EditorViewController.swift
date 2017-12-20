//
//  EditorViewController.swift
//  getLetter
//
//  Created by Corentin Marzin on 20/12/2017.
//  Copyright © 2017 getLetter. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {
    
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet var UserDragged: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.userDragged(_:)))
        bottomTextField.addGestureRecognizer(gesture)
        bottomTextField.isUserInteractionEnabled = true

    }
    
    @objc func userDragged(_ gesture: UIPanGestureRecognizer){
        let loc = gesture.location(in: self.view)
        self.bottomTextField.center = loc
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButton(_ sender: Any) {
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
