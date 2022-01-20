//
//  InnerMenuTableViewCell.swift
//  Final
//
//  Created by Brian Kim on 12/4/21.
//  Reusable cell configuration for inner menu table view

import UIKit

class InnerMenuTableViewCell: UITableViewCell {

    //Connect outlets
    @IBOutlet weak var innerImage: UIImageView!
    @IBOutlet weak var innerLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
