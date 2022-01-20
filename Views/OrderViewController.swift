//
//  OrderViewController.swift
//  Final
//
//  Created by Brian Kim on 12/4/21.
//  View Controller for completed order

import UIKit

class OrderViewController: UIViewController {
    
    //Connect outlets
    @IBOutlet weak var ordernoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Assign the user a random 4 digit number for their order number
        ordernoLabel.text = String(Int.random(in: 1000...9999))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapDoneBtn(_ sender: Any) {
        //clear cart on completed order
        cart = []
        //Return to previous views
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    

}
