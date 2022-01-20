//
//  DetailViewController.swift
//  Final
//
//  Created by Brian Kim on 12/4/21.
//  View controller for detailed view of item

import UIKit

class DetailViewController: UIViewController {
    //Connect outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addToCButton: UIButton!
    
    var productName = ""
    var productImg = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set title and image
        titleLabel.text = productName
        productImage.image = productImg
        
        //Initial quantity to 1
        quantityLabel.text = "1"
        //Set price based on item
        switch productName {
        case "Soft Drink", "Coffee", "Tea":
            priceLabel.text = "$0.99"
        case "French Fries":
            priceLabel.text = "$1.99"
        case "Onion Rings":
            priceLabel.text = "$2.99"
        case "Burger", "Breakfast Wrap", "Chicken Wrap", "Chicken Nuggets":
            priceLabel.text = "$3.99"
        case "Cheese Burger", "Chicken Burger":
            priceLabel.text = "$4.99"
        case "Angus Burger":
            priceLabel.text = "$5.99"
        default:
            priceLabel.text = ""
        }
    }
    
    //Event cart button pressed on top nav bar
    @IBAction func tapCartBtn(_ sender: Any) {
        //Go to cart view
        let cvc = storyboard?.instantiateViewController(identifier: "CartViewController") as? CartViewController
        self.navigationController?.pushViewController(cvc!, animated: true)
    }
    
    //Event - button pressed
    @IBAction func tapSubBtn(_ sender: Any) {
        //Decrease quantity, except minimum quantity is 1
        var quantity = Int(quantityLabel.text!)
        if (quantity! > 1) {
            quantity! -= 1
        }
        quantityLabel.text = String(quantity!)
    }
    
    //Event + button pressed
    @IBAction func tapAddBtn(_ sender: Any) {
        //Increase quantity
        var quantity = Int(quantityLabel.text!)

        quantity! += 1

        quantityLabel.text = String(quantity!)
    }
    
    //Event add to cart button pressed
    @IBAction func tapAtCBtn(_ sender: Any) {
        var isDuplicate = false
        
        //Check if item is already in cart
        for food in cart {
            if food.name == productName {
                isDuplicate = true
            }
        }
        
        //If item is already in cart, just increase quantity of that item
        if isDuplicate {
            for food in cart {
                if food.name == productName {
                    food.quantity += Int(quantityLabel.text!)!
                }
            }
        //Else create and add item to cart
        } else {
            let currentFood:FoodItem = FoodItem()
            currentFood.name = productName
            currentFood.picture = productImg
            currentFood.price = Float(priceLabel.text!.dropFirst())!
            currentFood.quantity = Int(quantityLabel.text!)!
            cart.append(currentFood)
        }

    }

}
