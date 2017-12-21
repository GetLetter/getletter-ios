//
//  FruitsTableViewController.swift
//  getLetter
//
//  Created by Corentin Marzin on 21/12/2017.
//  Copyright © 2017 getLetter. All rights reserved.
//

import UIKit
import Alamofire

class FruitsTableViewController: UITableViewController {
    
    var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    let headers: HTTPHeaders = [
        "Authorization": token as! String,
        "Content-type": "application/json"
    ]
    
    func getToken(completion: @escaping (String) -> Void) {
        print(token)
        
        Alamofire.request("https://get-letter-api.herokuapp.com/items", method: .get, headers: headers).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                print("data fruit", data)
            case .failure:
                print("not good")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getToken() { response in
            print("response", response)
        }
        
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let fruitName = fruits[indexPath.row]
        cell.textLabel?.text = fruitName
        cell.detailTextLabel?.text = "Delicious!"
        cell.imageView?.image = UIImage(named: fruitName)
        
        return cell
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
