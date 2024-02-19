//
//  ViewController.swift
//  12_28_alamofire
//
//  Created by csuftitan on 12/27/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    var posts : [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        httpNetworkingByAlamofire()
    }

    func httpNetworkingByAlamofire(){
        AF.request(urlString).response{ response in
            print(response.response)
            print(response.data)
            print(response.error)
            
            print(response.result) //result.value is deprecated we use switch case
            
            //use switch case because result is in data and error format
            switch response.result{
            case .success(let data):
                self.posts = try! JSONDecoder().decode([Post].self, from: data!)
                print(self.posts)//check data
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
                
                //no need for default as there are only two possibilities
            }
            
        }
        
    }
    
}

