//
//  MenuViewCell.swift
//  Final
//
//  Created by user194219 on 12/4/21.
//  Reusable cell configuration for general menu table view

import UIKit

class MenuViewCell: UITableViewCell {
    //Connect outlets
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
