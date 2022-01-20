//
//  CartViewController.swift
//  Final
//
//  Created by Brian Kim on 12/4/21.
//  View Controller for cart

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Connect outlets
    @IBOutlet weak var locLabel: UILabel!
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    
    //Variable for total price of order
    var total:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calcTotal()
        
        //Print currently chosen location and total price to label
        locLabel.text = loc
        totalLabel.text = String(format: "Total: $%.2f", total)
        
        //setup table view
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    
    //Calculate total price of order and assign it to total
    func calcTotal() {
        total = 0
        for food in cart {
            let calcPrice = String(format: "%.2f", food.price * Float(food.quantity))
            total += Float(calcPrice)!

        }
    }
    
    //Rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    //Reusable cell to create each row in cart
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        
        //Get item data from cart array
        let itemTitle = cart[indexPath.row].name
        let itemImg = cart[indexPath.row].picture
        let itemQuan = "x" + String(cart[indexPath.row].quantity)
        let itemPrice = String(format: "$%.2f", cart[indexPath.row].price * Float(cart[indexPath.row].quantity))
        
        //Assign data to cell
        cell.nameLabel.text = itemTitle
        cell.itemImage.image = itemImg
        cell.quantityLabel.text = itemQuan
        cell.priceLabel.text = itemPrice
        
        return cell
        
    }
    
    //Configure trailing action to swipe to delete
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //Create action
        let deleteAction = UIContextualAction(style: .normal, title: "Delete", handler: {
            (action, view, completionHandler) in
            
            
            //Delete from array
            cart.remove(at: indexPath.row)
            //Delete from table view
            self.cartTableView.deleteRows(at: [indexPath], with: .automatic)
            self.cartTableView.reloadData()
            
            completionHandler(true)
            
        })
        
        //Set color
        deleteAction.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    //Event Check Out button tapped
    @IBAction func tapCOBtn(_ sender: Any) {
        
        //If location is not chosen, alert user
        if loc == "" {
            let alert = UIAlertController(title: "Error", message: "Please choose a location from map!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            
            present(alert, animated: true)
        }
        //If cart is empty, alert user
        else if cart.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Please add something to cart!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            
            present(alert, animated: true)
        }
        //Else go to completed order view
        else {
            let ovc = storyboard?.instantiateViewController(identifier: "OrderViewController") as? OrderViewController
            
            self.navigationController?.pushViewController(ovc!, animated: true)
        }
        
    }

}
