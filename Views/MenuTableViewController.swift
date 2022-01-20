//
//  MenuTableViewController.swift
//  Final
//
//  Created by Brian Kim on 12/4/21.
//  View controller for general menu

import UIKit

//Class for each food item
public class FoodItem {
    var name:String = ""
    var picture:UIImage = UIImage()
    var price:Float = 0
    var quantity:Int = 0
}

//Cart array to track items that are added to cart, used globally
public var cart:[FoodItem] = []

class MenuTableViewController: UITableViewController {

    //Connect outlets
    @IBOutlet weak var menuTableView: UITableView!
    
    //Arrays for table view
    let menus = ["Burgers", "Snacks", "Sides", "Drinks"]
    let menuimgs = [UIImage(named: "burger"), UIImage(named: "snack"), UIImage(named: "side"),UIImage(named: "drink")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Setup table view
        menuTableView.delegate = self
        menuTableView.dataSource = self

    }

    // MARK: - Table view data source

    //Number of sections in table
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    //Number of rows in table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menus.count
    }

    //Configure cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuViewCell
        
        //Get data from array
        let menuTitle = self.menus[indexPath.row]
        let menuImg = self.menuimgs[indexPath.row]
        
        //Set data to cell
        cell.menuImage.image = menuImg
        cell.menuLabel.text = menuTitle


        return cell
    }
    
    //Event row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Create inner menu view controller
        let tvc = storyboard?.instantiateViewController(identifier: "InnerMenuTableViewController") as? InnerMenuTableViewController
        //Pass different data to inner menu vc based on category selected
        switch indexPath.row {
        //Burger selected
        case 0:
            tvc?.innerMenus = ["Burger", "Cheese Burger", "Angus Burger", "Chicken Burger"]
            tvc?.innerMenuImgs = [UIImage(named: "regular")!, UIImage(named: "cheese")!, UIImage(named: "angus")!, UIImage(named: "chicken")!]
        //Snack selected
        case 1:
            tvc?.innerMenus = ["Breakfast Wrap", "Chicken Wrap"]
            tvc?.innerMenuImgs = [UIImage(named: "breakfastwrap")!, UIImage(named: "chickenwrap")!]
        //Side selected
        case 2:
            tvc?.innerMenus = ["French Fries", "Chicken Nuggets", "Onion Rings"]
            tvc?.innerMenuImgs = [UIImage(named: "fries")!, UIImage(named: "nuggets")!, UIImage(named: "orings")!]
        //Drink selected
        case 3:
            tvc?.innerMenus = ["Soft Drink", "Coffee", "Tea"]
            tvc?.innerMenuImgs = [UIImage(named: "softdrink")!, UIImage(named: "coffee")!, UIImage(named: "tea")!]
        default:
            print("Error while loading menu")
        }
        //Go to inner menu view
        self.navigationController?.pushViewController(tvc!, animated: true)
    }

    //Event cart button pressed on top nav bar
    @IBAction func cartBtn(_ sender: Any) {
        //Go to cart view
        let cvc = storyboard?.instantiateViewController(identifier: "CartViewController") as? CartViewController
        self.navigationController?.pushViewController(cvc!, animated: true)
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
