//
//  UIImageView+Extension.swift
//  ShoppingApp
//
//  Created by Dervis YILMAZ on 30.12.2022.
//

import UIKit

extension UIImageView {
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        
                    }
                }
                
            }
        }
    }
}
