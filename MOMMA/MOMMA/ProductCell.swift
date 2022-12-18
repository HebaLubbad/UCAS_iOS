//
//  ProductCell.swift
//  MOMMA
//
//  Created by macbook on 18/12/2022.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var ImageProduct: UIImageView!
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var categoryProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
    }

    
    func set_product (product:Product) {
        
        self.ImageProduct.image = product.img
        self.titleProduct.text = product.title
        self.categoryProduct.text = product.category
        self.priceProduct.text =  "\(product.price)"
    }


}
