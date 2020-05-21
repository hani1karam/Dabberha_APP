//
//  DetailsVC.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/20/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class DetailsVC: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var HomeTV: UITableView!

    var items = [Datum]()
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeTV.delegate = self
        HomeTV.dataSource = self
        loadCompained()
        
    }
    

    func loadCompained(){
        startAnimating()
        NetworkApi.sendRequest(method: .post, url: "https://salemsaber.com/websites/dabberha_dynamic/api/ar/EGP/allCategories", completion:
             
             {(err,status,response: Compines?) in
                self.stopAnimating()
                 if err == nil{
                     guard let data = response?.data else{return}
                     self.items = data.self
                     self.HomeTV.reloadData()
                     
                 }
         })
     }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Home = HomeTV.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
        Home.name.text = items[indexPath.row].title
        Home.configure(compines: self.items[indexPath.row])
        Home.Order.addTarget(self, action: #selector(subscribeTapped(_:)), for: .touchUpInside)

        
        return Home
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    @objc func subscribeTapped(_ sender: UIButton){
        // use the tag of button as index
   
        
 
        NetworkApi.sendRequest(method: .post, url: "https://talabat.art4muslim.net/api/getOrder?restId=3&langu=en",completion: { (err,status,response: OrderResponse?) in
             if err == nil{
                 if status == true{
                    self.showAlertsuccess(title: "Wait some time")
                    let data = response.self
                    self.HomeTV.reloadData()
                }else{
                }
            }
        })
    }

}
