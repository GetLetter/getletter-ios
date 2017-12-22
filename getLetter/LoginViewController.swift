//
//  LoginViewController.swift
//  getLetter
//
//  Created by Corentin Marzin on 20/12/2017.
//  Copyright © 2017 getLetter. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

var token: Any!

class LoginViewController: UIViewController {
    
    let parameters: Parameters = [
        "email": "corentin@gmail.com",
        "password": "123456"
    ]
    
    func getToken(completion: @escaping (String) -> Void) {
        Alamofire.request("https://get-letter-api.herokuapp.com/authenticate", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                
                struct RepoOwner: JSONDecodable {

                    let auth_token: String?

                    // MARK: - Deserialization

                    init?(json: JSON) {
                        self.auth_token = "auth_token" <~~ json
                    }
                }
                
                guard let repoOwner = RepoOwner(json: data as! JSON) else {
                    // handle decoding failure here
                    return
                }
                
                // global var token
                token = repoOwner.auth_token
                
                print("TOKEN STRING", repoOwner.auth_token)
                
            case .failure:
                print("not good")
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getToken() { response in
            token = response
            self.performSegue(withIdentifier: "loginSuccess", sender:self)
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
}
