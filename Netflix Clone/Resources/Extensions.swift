//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Jim Yang on 2023-08-09.
//

import Foundation

extension String{
    func capitalizeFirstLetter()->String{
        return self.prefix(1).uppercased()+self.lowercased().dropFirst()
    }
    
}
