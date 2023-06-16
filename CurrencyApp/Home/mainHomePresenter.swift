//
//  mainHomePresenter.swift
//  CurrencyApp
//
//  Created by aya on 13/06/2023.
//

import Foundation
import UIKit


protocol mainHomePresenter {

func getAllCurrencies()
func getAllCurrenciesByBase(base: String)


}

class mainHomePresenterClass: mainHomePresenter {
    
    private var view: homeView!
    init(view: homeView) {
        self.view = view
    }
   
    var ratesValues : [String:Double] = [:]
    var ratesBaseValues : [String:Double] = [:]

    func getAllCurrencies(){
        APIClient.getAllCurrencies() { [self] (error, msg) in
            if error != nil{
              //  self.view.showError(msg:"خطأ في الدخول!!")

            }
            else{
              //  self.view.hideLoadingIndicator()
                print(msg!.success)
                if msg?.success == true {
                    print("success")
                    
                  self.ratesValues = (msg?.rates)!
                    self.view.setupDropDown(array: self.ratesValues)
                    self.view.setupDropDown1(array: self.ratesValues)

                 // self.view.reloadData()
                    
                }else{
               // self.view.showError(msg: "خطأ في البيانات")
             //   self.view.hideLoadingIndicator()
                  //  self.view.removeSnipperView()

                }
            }
        }
    }

    
    
    func getAllCurrenciesByBase(base: String){
        
        ratesBaseValues.removeAll()
        APIClient.getAllCurrenciesByBase(base: base) { [self] (error, msg) in
            if error != nil{
              //  self.view.showError(msg:"خطأ في الدخول!!")

            }
            else{
              //  self.view.hideLoadingIndicator()
                print(msg!.result)
                if msg?.result == "success" {
                    print("success")

                    self.ratesBaseValues = (msg?.rates)!
             
                    self.view.reloadDataWithNewBaseCurrencies(array:  self.ratesBaseValues)
                 // self.view.reloadData()
                    
                }else{
               // self.view.showError(msg: "خطأ في البيانات")
             //   self.view.hideLoadingIndicator()
                  //  self.view.removeSnipperView()

                }
            }
        }
    }
    
   
}
