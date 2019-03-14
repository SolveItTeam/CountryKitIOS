//
//  AllCountryViewController.swift
//  CountryKitDemo
//
//  Created by ios dev on 3/12/19.
//  Copyright © 2019 SolveIt. All rights reserved.
//

import UIKit
import CountryKitIOS


final class AllCountryViewController: UIViewController {
    private struct Constants {
        static let reuseIdentifier = "reuse"
    }
    
    @IBOutlet private weak var tableView: UITableView!
    private var countriesInfo = [CountryInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let kit = CountryKit.build()
        countriesInfo = kit.getAllCountriesInfo()
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.reuseIdentifier)
        tableView.reloadData()
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension AllCountryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath) as! CountryTableViewCell
        cell.countryNameLabel.text = countriesInfo[indexPath.row].countryName
        cell.countryCodeLabel.text = countriesInfo[indexPath.row].countryID
        cell.countyNumberPrefixLabel.text = countriesInfo[indexPath.row].phoneCodePrefix
        return cell
    }
}
