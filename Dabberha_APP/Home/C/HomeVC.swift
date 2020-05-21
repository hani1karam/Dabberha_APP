//
//  HomeVC.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/19/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
 
class HomeVC: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource  {
    
    
    
    static func instance () -> HomeVC {
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
    }
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var pagecontroller: UIPageControl!
    @IBOutlet weak var ProductCV: UICollectionView!
    @IBOutlet weak var ITEMCV: UICollectionView!
    
    var timer = Timer()
    var counter = 0
    var companyArray = [AllProductDatum]()
    var id: Int?
    var quantity: Int?
    var index = 0
    var product = [ItemDatum]()
    var imgarray = [UIImage(named: "1"),
                    UIImage(named: "2"),
                    UIImage(named: "3"),
                    UIImage(named: "4") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        ProductCV.delegate = self
        ProductCV.dataSource = self
        ITEMCV.delegate = self
        ITEMCV.dataSource = self
        pagecontroller.numberOfPages = imgarray.count
        pagecontroller.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
            
        }
        loadproudct()
        loaditem()
    }
    
    
    
    @objc func changeImage() {
        
        if counter < imgarray.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.collection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pagecontroller.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collection.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pagecontroller.currentPage = counter
            counter = 1
        }
        
    }
    func loadproudct(){
        self.showLoadingIndicator()
        NetworkApi.sendRequest(method: .post, url: "https://salemsaber.com/websites/dabberha_dynamic/api/ar/EGP/allProducts", completion:
            
            {(err,status,response: AllProduct?) in
                self.hideLoadingIndicator()
                
                if err == nil{
                    if status == true {
                        self.showAlertsuccess(title: "Done")
                        
                        guard let data = response?.data else{return}
                        self.companyArray = data.self
                        self.ProductCV.reloadData()
                        
                    }
                }
        })
    }
    func loaditem(){
        self.showLoadingIndicator()
        NetworkApi.sendRequest(method: .post, url: "https://salemsaber.com/websites/dabberha_dynamic/api/ar/EGP/featuredProducts", completion:
            
            {(err,status,response: Item?) in
                self.hideLoadingIndicator()
                
                if err == nil{
                    if status == true {
                        self.showAlertsuccess(title: "Done")
                        
                        guard let data = response?.data else{return}
                        self.product = data.self
                        self.ITEMCV.reloadData()
                        
                    }
                }
        })
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collection{
            return imgarray.count
        }
        else if collectionView == ProductCV {
            return self.companyArray.count
        }
        else {
            return self.product.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 
               index = indexPath.row
               performSegue(withIdentifier: "Home", sender: self)
               
           
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collection{
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            if let vc = cell.viewWithTag(111) as? UIImageView {
                vc.image = imgarray[indexPath.row]
                
            }
            return cell
        }
        else if collectionView == ProductCV {
            let HomeCell = ProductCV.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! CollectionViewCell
            HomeCell.title.text = companyArray[indexPath.row].title
            HomeCell.price.text = "price:   \(companyArray[indexPath.row].price ?? "")"
            HomeCell.qunatity.text = "qunatity:   \(String(describing: companyArray[indexPath.row].quantity ?? 0))"
            HomeCell.AddToCart.addTarget(self, action: #selector(subscribeTapped(_:)), for: .touchUpInside)
            
            //  HomeCell.configure(compines: companyArray[indexPath.row])
            
            return HomeCell
            
        }
        else {
            let products = ITEMCV.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HomeCollectionViewCell
            
            products.price.text = product[indexPath.row].price
            products.ttle.text = product[indexPath.row].title
           // products.configure(compines: product[indexPath.row])
            return products
        }
        
    }
    
    @objc func subscribeTapped(_ sender: UIButton){
        // use the tag of button as index
        
        let param = ["userId":"1",
                     "productId":"1",
                     "quantity":"1"]as [String : Any]
        startAnimating()
        
        NetworkApi.sendRequest(method: .post, url:cart,parameters:param,completion:
            
            {(err,status,response: CartResponse?) in
                self.stopAnimating()
                if err == nil{
                    
                    if status == true {
                         guard let data = response?.data else{return}
                        self.showAlertsuccess(title: data)

                        print(data)
                    }
                }
        })
        
        
        
    }
    
}
let imageCache = NSCache<NSString, AnyObject>()

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collection{
        let size = collection.frame.size
        return CGSize(width: size.width, height: size.height)
        }
        else {
            let size = ProductCV.frame.size
            return CGSize(width: size.width, height: size.height)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
 

}


 
 
