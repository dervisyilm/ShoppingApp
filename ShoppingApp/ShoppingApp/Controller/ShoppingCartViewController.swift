//
//  ShoppingCartViewController.swift
//  ShoppingApp
//
//  Created by Dervis YILMAZ on 29.12.2022.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadShoppingList() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        CartViewModel.shared.loadShoppingList{ response in
            if(response){
                self.tableView.dataSource = (self as any UITableViewDataSource)
                self.tableView.reloadData()
            }
            
        }
    }
    
    private func loadShoppingList() {
        
        CartViewModel.shared.loadShoppingList{ response in
            if(response){
                self.tableView.dataSource = (self as any UITableViewDataSource)
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func checkOutAction(sender:AnyObject){
        
        print("checkOut action")
        
        let checkOutAlert = UIAlertController(title: "Checkout", message: "Checkout completed", preferredStyle: UIAlertController.Style.alert)
        
        checkOutAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
            self.navigationController?.popViewController(animated: true)
            CartViewModel.shared.setEmptyCart()
        }))
        
        present(checkOutAlert, animated: true, completion: nil)
        
    }
    
}

// MARK: - TableView
extension ShoppingCartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartViewModel.shared.shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chartListCell", for: indexPath) as! ChartListTableViewCell
        
        let product = CartViewModel.shared.shoppingList[indexPath.row]
        cell.setCellWithValuesOf(product)
        return cell
    }
}
