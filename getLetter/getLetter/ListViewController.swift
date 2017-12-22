//
//  ListViewController.swift
//  getLetter
//
//  Created by Corentin Marzin on 21/12/2017.
//  Copyright © 2017 getLetter. All rights reserved.
//

import UIKit
import Alamofire

class TemplateTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var TemplateTablViewCellLabel: UILabel!
    @IBOutlet weak var TemplateTableViewCellImage: UIImageView!
}

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TemplateTableView: UITableView!
    
    var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getToken() { response in
            print("response", response)
        }
        TemplateTableView.delegate = self
        TemplateTableView.dataSource =  self
        // Do any additional setup after loading the view.
    }
    
    // MARK: Call API
    
    let headers: HTTPHeaders = [
        "Authorization": token as! String,
        "Content-type": "application/json"
    ]

    func getToken(completion: @escaping (String) -> Void) {
        print(token)

        Alamofire.request("https://get-letter-api.herokuapp.com/items", method: .get, headers: headers).responseJSON { response in

            switch response.result {
            case .success(let data):
                print("data from the api", data)
            case .failure:
                print("not good")
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section \(section)"
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TemplateTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TemplateTableViewCell
        
        print("cell", cell)
        
        let fruitName = fruits[indexPath.row]
        cell.textLabel?.text = "Bonjour ?"
        cell.imageView?.image = UIImage(named: fruitName)
        
        return cell
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
