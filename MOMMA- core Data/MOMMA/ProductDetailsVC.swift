//
//  ProductDetailsVC.swift
//  MOMMA
//
//  Created by macbook on 18/12/2022.
//

import UIKit


protocol transferBackData  {
    
    func transferData(product:Product)
}


class ProductDetailsVC: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate {

    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var detailsTV: UITextView!
    @IBOutlet weak var isFavBtn: UIButton!
    @IBOutlet weak var productImg: UIImageView!
    
    
    var product:Product?
    var transferDelegate: transferBackData?
    var isSave:Bool  = true
    var img_picker :UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBtn.layer.cornerRadius = 25
        
        if (product != nil ) {
            self.categoryLbl.text = product?.category
            self.priceLbl.text = "\(product?.price ?? 0.0)"
            self.detailsTV.text = product?.details
            self.titleLbl.text = product?.title
            let image_name = (product?.isFav ?? false) ?  "filled_heart" : "heart_empty"
            let image_name2 = !(product?.isFav ?? false) ?  "filled_heart" : "heart_empty"
            isFavBtn.setImage(UIImage(named: image_name), for: .normal)
            isFavBtn.setImage(UIImage(named:image_name2), for: .selected)
            
            productImg.image = product?.img
            
        }else  {
            product = Product(
                id: 0,
                title: "",
                category: "",
                img: UIImage(named: "bag_2")!,
                isFav: false,
                price: 0.0,
                details: "")
            
        }
    }

    
    
    @IBAction func SavaUpdatesAction(_ sender: Any)
    {
        if (isSave) {
      
            let  p1 =  Product_Entity(context: db_context) // CREATE FOT MANAGED OBJECT 
            p1.id  =  Int16(self.getCountProducts())
            p1.name =  product?.title
            p1.price =  product?.price ?? 0.0
            p1.img = product?.img
            p1.category = product?.category
            p1.isFav = product?.isFav  ?? false
            p1.details = product?.details
            
            app_delegate.saveContext()
            print("Saved Successfully")
          
        
            
        }else{
            
            self.transferDelegate?.transferData(product: self.product!)
           
            
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeImageAction(_ sender: Any) {
        img_picker = UIImagePickerController()
        img_picker?.delegate = self
        img_picker?.sourceType = .photoLibrary
        img_picker?.mediaTypes = ["public.image", "public.movie"]
        self.present(img_picker!, animated: true, completion: nil)
       
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[.originalImage] as! UIImage
      
        self.dismiss(animated: true) {
            self.product?.img = img
            self.productImg.image = img
            
        }
    }
    
    
    @IBAction func editTitleAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Edit Product Title", message: "", preferredStyle: .alert)
        let saveAction  =  UIAlertAction(title: "Save", style: .default) { action in
            print("Save")
        }
        let cancelAction  =  UIAlertAction(title: "Cancel", style: .destructive) { action in
            print("Cancel")
        }
        alertController.addTextField { textField in
            textField.text = self.product?.title
            textField.placeholder = "Place product title here"
            textField.delegate = self
            textField.tag = 0
            textField.addTarget(self,action: #selector(self.textFieldShouldReturn(_:)), for: .editingDidEnd)
        }
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print(textField.text ?? "")
        switch textField.tag {
        case 0 :
            product?.title = textField.text ?? ""
            titleLbl.text = textField.text ?? ""
        case 1 :
            product?.price =  Double(textField.text ?? "") ?? 0.0
            priceLbl.text = textField.text ?? ""
        case 2 :
            product?.category = textField.text ?? ""
            categoryLbl.text = textField.text ?? ""
        default:
            print("Undefind")
        }
      
        return true
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.product?.details = textView.text
        
        self.view.endEditing(true)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n"){
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @IBAction func editCategoryAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Edit Product Category", message: "", preferredStyle: .alert)
        let saveAction  =  UIAlertAction(title: "Save", style: .default) { action in
            print("Save")
        }
        let cancelAction  =  UIAlertAction(title: "Cancel", style: .destructive) { action in
            print("Cancel")
        }
        alertController.addTextField { textField in
            textField.text = self.product?.category
            textField.placeholder = "Place product category here"
            textField.delegate = self
            textField.tag = 2
            textField.addTarget(self,action: #selector(self.textFieldShouldReturn(_:)), for: .editingDidEnd)
        }
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func editPriceAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Edit Product Price", message: "", preferredStyle: .alert)
        let saveAction  =  UIAlertAction(title: "Save", style: .default) { action in
            print("Save")
        }
        let cancelAction  =  UIAlertAction(title: "Cancel", style: .destructive) { action in
            print("Cancel")
        }
        alertController.addTextField { textField in
            textField.text = "\(self.product?.price ?? 0.0)"
            textField.placeholder = "Place product price here"
            textField.delegate = self
            textField.tag = 1
            textField.addTarget(self,action: #selector(self.textFieldShouldReturn(_:)), for: .editingDidEnd)
        }
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    @IBAction func toggleIsFavAction(_ sender: UIButton) {
       
        sender.isSelected.toggle()
        product?.isFav.toggle()
    }
    
    
}
