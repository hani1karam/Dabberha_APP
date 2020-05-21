//
//  HomeCollectionViewCell.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/20/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var ttle: UILabel!
    @IBOutlet weak var price: UILabel!
    
     func configure(compines: ItemDatum) {
        
        DispatchQueue.main.async {
            if let img = compines.images{
                self.img.setImage(imageUrl: img as? String ?? "")
            }
        }
    }

}
