//
//  CountryKit.swift
//  CountryKit
//
//  Created by ios dev on 3/12/19.
//

import Foundation
import CoreTelephony

public class CountryKit {
    private struct Constants {
        static let bundleName = "CountryKitIOS"
        static let dataPath = "CountryCodeInfo"
    }
    
    private let allCountryInfo: [CountryInfo]
    
    public required init() {
        let bundle = Bundle(identifier: Constants.bundleName)!
        let path = bundle.path(forResource: Constants.dataPath, ofType: "json")!
        let text = try! String(contentsOfFile: path)
        let countriesData = try! JSONDecoder().decode([CountryData].self, from: text.data(using: .utf8)!)
        
        let currentLocaleIdentifier = NSLocale.current.identifier
        let countries: [CountryInfo?] = countriesData.map{ item in
            let localeCountryCode = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: item.countryID])
            let countryName = NSLocale(localeIdentifier: currentLocaleIdentifier).displayName(forKey: NSLocale.Key.identifier,
                                                                                              value: localeCountryCode)
            guard let unwrappedCountryName = countryName else { return nil }
            return CountryInfo(countryID: item.countryID,
                               countryName: unwrappedCountryName,
                               phoneCodePrefix: item.phoneCodePrefix)
        }
        allCountryInfo = countries.compactMap{ $0 }
    }
    
    public func getAllCountriesInfo()-> [CountryInfo] {
        return allCountryInfo
    }
    
    public func getCurrentCountyInfo()-> CountryInfo? {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider
        guard let countryInfo = carrier?.isoCountryCode?.uppercased() else { return nil }
        return allCountryInfo.first(where: {
            $0.countryID == countryInfo
        })
    }
}
