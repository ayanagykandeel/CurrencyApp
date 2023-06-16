//
//  APIClient.swift
//  CurrencyApp
//
//  Created by aya on 13/06/2023.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {

    class func getAllCurrencies( completion: @escaping (Error?, currencyModel?) -> Void) {
        
        AF.request(URLS.allCurrenciesURL+"?access_key=\(URLS.accessKey)", method: .get).validate(statusCode: 200..<600).responseJSON { response in
            switch response.result {
            case .success(let value):
                
                do {
                    let myModel = try JSONDecoder().decode(currencyModel.self, from: response.data!)
                    completion(nil, myModel)
                    
                } catch {
                    print("error")
                    completion(error,nil)
                }
              //  print(value)
            case .failure(let error):
                print(error)
                completion(error, nil)

            }
        }
    }
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    class func getAllCurrenciesByBase(base: String ,completion: @escaping (Error?, currencyBaseModel?) -> Void) {
        
        AF.request(URLS.convertCurrencyWithSymbol+"\(base)", method: .get).validate(statusCode: 200..<600).responseJSON { response in
            switch response.result {
            case .success(let value):
                
                do {
                    let myModel = try JSONDecoder().decode(currencyBaseModel.self, from: response.data!)
                    completion(nil, myModel)
                    
                } catch {
                    print("error")
                    completion(error,nil)
                }
              //  print(value)
            case .failure(let error):
                print(error)
                completion(error, nil)

            }
        }
    }
    
    
    
    
    
    
    
}

