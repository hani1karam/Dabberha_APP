//
//  CollectionViewCell.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/19/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import Kingfisher
class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var qunatity: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var AddToCart: UIButton!
    
    
 
     func configure(compines: AllProductDatum) {
        
        DispatchQueue.main.async {
            if let img = compines.images{
                self.img.setImage(imageUrl: img as? String ?? "")
            }
        }
    }
    
    @IBAction func AddToCart(_ sender: Any) {
        /*
        let param = ["userId":"1",
                     "productId":"1",
                     "quantity":"1"]as [String : Any]
        
        NetworkApi.sendRequest(method: .post, url:cart,parameters:param,completion:
            
            {(err,status,response: CartResponse?) in
               
                if err == nil{
                    if status == true {
                        guard let data = response?.data else{return}
                        print(data)
                    }
                }
        })*/
    }
    
}
extension UIImageView {
    func setImage(imageUrl: String){
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string:imageUrl), placeholder: nil, options: [.transition(.fade(0.7))],   completionHandler: nil)
    }
}
