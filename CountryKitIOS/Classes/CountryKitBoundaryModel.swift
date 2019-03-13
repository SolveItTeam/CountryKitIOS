//
//  CountryKitBoundaryModel.swift
//  CountryKit
//
//  Created by ios dev on 3/12/19.
//

import Foundation

class CountryData: Decodable {
    let countryID: String
    let phoneCodePrefix: String
}

public class CountryInfo {
    public let countryID: String
    public let countryName: String
    public let phoneCodePrefix: String
    
    public required init(countryID: String,
                         countryName: String,
                         phoneCodePrefix: String) {
        self.countryID = countryID
        self.countryName = countryName
        self.phoneCodePrefix = phoneCodePrefix
    }
}
