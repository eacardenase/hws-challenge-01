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
    lazy var countryFlag: UIImageView = {
        let imageView = CountryFlag(country: country)
    
        return imageView
    }()
    
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
        view.backgroundColor = .white
        
        title = country.name.uppercased()
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(countryFlag)
        
        NSLayoutConstraint.activate([
            countryFlag.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            countryFlag.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryFlag.heightAnchor.constraint(equalToConstant: 100),
            countryFlag.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

// MARK: - Action

extension CountryDetails {
    @objc func shareTapped() {
        guard let countryFlag = countryFlag.image?.jpegData(compressionQuality: 0.7) else { fatalError("Could not share selected flag") }
        
        let activityViewController = UIActivityViewController(activityItems: [countryFlag, country.name.uppercased()], applicationActivities: [])
        
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityViewController, animated: true)
    }
}
