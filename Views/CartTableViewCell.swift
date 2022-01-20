//
//  CartTableViewCell.swift
//  Final
//
//  Created by Brian Kim on 12/4/21.
//  Reusable cell configuration for cart table view

import UIKit

class CartTableViewCell: UITableViewCell {

    //Connect outlets
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
