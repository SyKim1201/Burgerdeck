//
//  InnerMenuTableViewController.swift
//  Final
//
//  Created by Brian Kim on 12/4/21.
//  View controller for inner menu

import UIKit

class InnerMenuTableViewController: UITableViewController {
    //Connect outlets
    @IBOutlet weak var innerMenuTableView: UITableView!
    
    //Arrays for table view
    var innerMenus:[String] = []
    var innerMenuImgs:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Setup table view
        innerMenuTableView.delegate = self
        innerMenuTableView.dataSource = self

    }

    // MARK: - Table view data source

    //Number of sections in table
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    //Number of rows in table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return innerMenus.count
    }

    //Configure cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = innerMenuTableView.dequeueReusableCell(withIdentifier: "innerMenuCell", for: indexPath) as! InnerMenuTableViewCell

        // Get data from array
        let innerTitle = self.innerMenus[indexPath.row]
        let innerImg = self.innerMenuImgs[indexPath.row]
        
        //Set data to cell
        cell.innerLabel.text = innerTitle
        cell.innerImage.image = innerImg
        
        return cell
    }
    
    //Event row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Create item detail view controller
        let dvc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        //Send item data to detail view controller
        dvc?.productName = self.innerMenus[indexPath.row]
        dvc?.productImg = self.innerMenuImgs[indexPath.row]
        
        //Go to item detail view controller
        self.navigationController?.pushViewController(dvc!, animated: true)
    }
    
    //Event cart button pressed on top nav bar
    @IBAction func tapCartBtn(_ sender: Any) {
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
