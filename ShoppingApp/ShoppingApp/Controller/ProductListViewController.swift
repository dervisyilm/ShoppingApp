//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Erdem Perşembe on 12.04.2022.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var productionListTableView: UITableView!
    
    @IBOutlet weak var totalAmountButton: UIButton!
    
    private var productViewModel = ProductViewModel()
    
    override func viewDidLoad() {

        super.viewDidLoad()
//        var productViewModel = ProductViewModel()
        loadProductList()
        
//        self.totalAmountButton.setTitle(String("$\(CartViewModel.shared.totalPrice)"), for: .normal)
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        self.totalAmountButton.setTitle(String("$\(CartViewModel.shared.totalPrice)"), for: .normal)
        CartViewModel.shared.loadShoppingList{ response in
            if(response){
                print("viewWillAppear \(CartViewModel.shared.shoppingList.count)")
                self.totalAmountButton.setTitle(String("$\(CartViewModel.shared.totalPrice)"), for: .normal)
                
            }
            
        }
        
        self.totalAmountButton.isEnabled = CartViewModel.shared.shoppingList.count == 0 ? false : true
        
    }
  
    private func loadProductList() {
        
        productViewModel.fetchProducts{ response in
            if (response){
                self.productionListTableView.dataSource = self
                self.productionListTableView.reloadData()
            }
            
        }
        
    }
    
    @IBAction func pressTotalAmountButton(sender:AnyObject){
        
        if let vc = storyboard?.instantiateViewController(identifier: "ShoppingCartViewController") as? ShoppingCartViewController{
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

extension ProductListViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(identifier: "ProductDetailViewController") as? ProductDetailViewController{
            
            let product = productViewModel.productList[indexPath.row]
            vc.product = product
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

// MARK: - TableView
extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewModel.productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productListCell", for: indexPath) as! ProductListTableViewCell
        let product = productViewModel.productList[indexPath.row]
        cell.setCellWithValuesOf(product)
        self.view.setNeedsDisplay()
        return cell
    }
}

