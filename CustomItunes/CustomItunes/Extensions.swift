//
//  Extensions.swift
//  CustomItunes
//
//  Created by 低调 on 10/19/19.
//  Copyright © 2019 Kaiyuan Zhao. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(url: String){
        DispatchQueue.global().async {
            [weak self] in
            
            let myURL = URL(string: url)
            if let data = try? Data(contentsOf: myURL!) {
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
