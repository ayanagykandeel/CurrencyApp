//
//  URLs.swift
//  CurrencyApp
//
//  Created by aya on 13/06/2023.
//


import Foundation
import Alamofire

struct URLS {

    static let BASE_URL = "http://data.fixer.io/api/"
    static let accessKey = "b6f87c687029ada9af030328f45e8edf"
    
    static let allCurrenciesURL          : String = BASE_URL + "latest"
    static let convertCurrencyWithSymbol : String = "https://open.er-api.com/v6/latest/"

    
}
