//
//  currencyModel.swift
//  CurrencyApp
//
//  Created by aya on 13/06/2023.
//

import Foundation


struct currencyModel: Codable {
    
    var success     : Bool?
    var timestamp   : Double?
    var base        : String?
    var date        : String?
    var rates       : [String: Double]?
  
    

}


struct currencyBaseModel: Codable {
    var result                : String?
    var time_last_update_utc  : String?
    var base_code             : String?
    var time_next_update_utc  : String?
    var rates                 : [String: Double]?
  
    

}
