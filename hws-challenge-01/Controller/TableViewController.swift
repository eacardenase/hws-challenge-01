//
//  TableViewController.swift
//  hws-challenge-01
//
//  Created by Edwin Cardenas on 1/17/24.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var countryNames = [String]()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupData()
    }
}

// MARK: - Helpers

extension TableViewController {
    func configureUI() {
        title = "Flags Viewer"
        
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.reuseIdentifier)
    }
    
    func setupData() {
        countryNames += [
            "estonia",
            "france",
            "germany",
            "ireland",
            "italy",
            "monaco",
            "nigeria",
            "poland",
            "russia",
            "spain",
            "uk",
            "us"
        ]
    }
}

// MARK: - TableViewDelegate and DataSource

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.reuseIdentifier, for: indexPath) as? CountryCell
            else { fatalError("Could not cast tableViewCell into CountryCell") }
        let model = Country(name: countryNames[indexPath.row])
        
        cell.textLabel?.text = model.name.uppercased()
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = Country(name: countryNames[indexPath.row])
        
        let vc = CountryDetails(country: model)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
