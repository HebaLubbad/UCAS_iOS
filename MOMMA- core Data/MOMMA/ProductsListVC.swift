//
//  ProductsListVC.swift
//  MOMMA
//
//  Created by macbook on 18/12/2022.
//

import UIKit


// Model creation based Struct

// Model creation based Struct
struct Product {
    var id:Int
    var title:String
    var category:String
    var img: UIImage
    var isFav : Bool
    var price:Double
    var details:String
    
//    
//    init() {
//        
//        id = 0
//        title = ""
//        category = ""
//        img = UIImage()
//        isFav = false
//        price = 0.0
//        details = ""
//    }
//     
}



class ProductsListVC: UIViewController,transferBackData {

    @IBOutlet weak var clearBtn: UIBarButtonItem!
    @IBOutlet weak var ProdectList: UITableView!
    @IBOutlet weak var nameUserLbl: UILabel!

    
    var products_items : [Product] = [Product] ()
    
//    [
//        Product(
//            id : 1,
//            title: "Channel",
//                category: "Bag",
//                img:  UIImage(named: "bag_1")!,
//                isFav: true,
//                price: 100.0,
//                details: "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type and  scrambled it to make a type specimen book.  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the   industry’s standard dummy text ever since the 1500s,  when an unknown printer took a galley of type and  scrambled it to make a type specimen book. "),
//        Product(
//            id : 2,
//            title: "LV",
//            category: "Bad",
//            img:  UIImage(named: "bag_2")!,
//            isFav: false,
//            price: 80.0,
//            details: "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type and  scrambled it to make a type specimen book.  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the   industry’s standard dummy text ever since the 1500s,  when an unknown printer took a galley of type and  scrambled it to make a type specimen book. "
//        ),
//        Product(
//            id : 3,
//            title: "Prada",
//            category: "Bag",
//            img:  UIImage(named: "bag_1")!,
//            isFav: true,
//            price: 50.0,
//            details: "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type and  scrambled it to make a type specimen book.  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the   industry’s standard dummy text ever since the 1500s,  when an unknown printer took a galley of type and  scrambled it to make a type specimen book. "),
//
//    ]

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
      
        UserDefaults.standard.setValue("Heba Lubbad", forKey: "userName")
        
        let username : String =  UserDefaults.standard.value(forKey: "userName") as! String
        nameUserLbl.text = username
        
        
        
        self.GetProducts()
  

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.GetProducts()
        
    
    }
    
    @IBAction func ClearData(_ sender: Any) {
        
        self.clearAllProducts()
        GetProducts()
    }
    
    func GetProducts  ()
    
    {
        let entities : [Product_Entity] =  self.LoadProducts()
        self.products_items.removeAll()
        
        for entiy in entities
        {
            let pro =  Product(id: Int ( entiy.id ?? 0 ),
                    title: entiy.name ?? "",
                    category: entiy.category ?? "",
                    img: entiy.img as! UIImage,
                    isFav: entiy.isFav,
                    price: entiy.price ?? 0,
                    details: entiy.details ?? "")
            
            products_items.append(pro)
            
        }
        
        
        ProdectList.reloadData()
        
        
    }
    
    
    //Data recive function delegate
    func transferData(product: Product) {
//         var item =  products_items.first(where: { $0.id == product.id })
//        var index =  products_items.firstIndex(where: {$0.id == product.id})
//        if (index != nil ) {
//            products_items[index ?? 0] =  product
//        }else {
//            products_items.append(product)
//        }
        EditProducts(product: product)
       
        self.GetProducts()
        
     
    }
}

extension ProductsListVC : UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
            
            self.deleteProduct(index: indexPath.row)
            GetProducts()
            
        }
    }
    
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
        
        let  st  = UIStoryboard(name: "Main", bundle: .main)
        let vc = st.instantiateViewController(withIdentifier: "ProductDetails") as! ProductDetailsVC
        vc.product =  products_items[indexPath.row]
        vc.isSave = false
        vc.transferDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
