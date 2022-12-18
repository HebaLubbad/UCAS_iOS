//
//  ProductDetailsVC.swift
//  MOMMA
//
//  Created by macbook on 18/12/2022.
//

import UIKit

class ProductDetailsVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var detailsTV: UITextView!
    @IBOutlet weak var isFavBtn: UIButton!
    @IBOutlet weak var productImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBtn.layer.cornerRadius = 25

    }
    @IBAction func SavaUpdatesAction(_ sender: Any) {
    }
    
    @IBAction func changeImageAction(_ sender: Any) {
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
            textField.text = "Hello"
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
        return true
    }
    
    @IBAction func editPriceAction(_ sender: Any) {
    }
    @IBAction func toggleIsFavAction(_ sender: Any) {
    }
    
}
