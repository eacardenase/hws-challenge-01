//
//  CountryDetails.swift
//  hws-challenge-01
//
//  Created by Edwin Cardenas on 1/17/24.
//

import UIKit

class CountryDetails: UIViewController {
    
    // MARK: - Properties
    
    var country: Country
    
    init(country: Country) {
        self.country = country
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
}

// MARK: - Helpers

extension CountryDetails {
    func configureUI() {
        view.backgroundColor = .systemYellow
        
        title = country.name.uppercased()
    }
}
