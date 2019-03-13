//
//  CurrentCountryViewController.swift
//  CountryKitDemo
//
//  Created by ios dev on 3/12/19.
//  Copyright © 2019 SolveIt. All rights reserved.
//

import UIKit
import CountryKitIOS

final class CurrentCountryViewController: UIViewController {
    @IBOutlet weak var counrtyCode: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryNumberPrefix: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let kit = CountryKit()
        let info = kit.getCurrentCountyInfo()
        counrtyCode.text = info?.countryID
        countryName.text = info?.countryName
        countryNumberPrefix.text = info?.phoneCodePrefix
    }
}
