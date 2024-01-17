//
//  CountryFlag.swift
//  hws-challenge-01
//
//  Created by Edwin Cardenas on 1/17/24.
//

import UIKit

class CountryFlag: UIImageView {
    var country: Country
    
    init(country: Country) {
        self.country = country
        
        super.init(frame: .zero)
        
        image = UIImage(named: country.name)?.withRenderingMode(.alwaysOriginal)
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
