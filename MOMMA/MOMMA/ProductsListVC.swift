//
//  ProductsListVC.swift
//  MOMMA
//
//  Created by macbook on 18/12/2022.
//

import UIKit


// Model creation based Struct
struct Product {
    
    var title:String
    var category:String
    var img: UIImage
    var isFav : Bool
    var price:Double
    var details:String
}



class ProductsListVC: UIViewController {

    @IBOutlet weak var ProdectList: UITableView!


    var products_items =  [
        Product(title: "Channel",
                category: "Bag",
                img:  UIImage(named: "bag_1")!,
                isFav: true,
                price: 100.0,
                details: "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type and  scrambled it to make a type specimen book.  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the   industry’s standard dummy text ever since the 1500s,  when an unknown printer took a galley of type and  scrambled it to make a type specimen book. "),
        Product(
            title: "LV",
            category: "Bad",
            img:  UIImage(named: "bag_2")!,
            isFav: false,
            price: 80.0,
            details: "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type and  scrambled it to make a type specimen book.  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the   industry’s standard dummy text ever since the 1500s,  when an unknown printer took a galley of type and  scrambled it to make a type specimen book. "
        ),
        Product(
            title: "Prada",
            category: "Bag",
            img:  UIImage(named: "bag_1")!,
            isFav: true,
            price: 50.0,
            details: "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type and  scrambled it to make a type specimen book.  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the   industry’s standard dummy text ever since the 1500s,  when an unknown printer took a galley of type and  scrambled it to make a type specimen book. "),
        
    ]

    //
    //    let titles = ["Channel","LV","Brada"]
    //    let images = [
    //        UIImage(named: "bag_1"),
    //        UIImage(named: "bag_2"),
    //        UIImage(named: "bag_3")]
        // Array of products created
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProdectList.delegate = self
        ProdectList.dataSource = self

    }
}

extension ProductsListVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products_items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell =
        ProdectList.dequeueReusableCell(withIdentifier: "cell1")!
        as! ProductCell
        myCell.set_product(product: products_items[indexPath.row])
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("Cell Selected")
    }
    
}
