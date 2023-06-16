//
//  mainHomeConfigurator.swift
//  CurrencyApp
//
//  Created by aya on 13/06/2023.
//

import Foundation
protocol mainHomeConfigurator {
  func configure(viewController: mainHomeVC)
}

class mainHomeConfiguratorImplementation: mainHomeConfigurator {
    func configure(viewController: mainHomeVC) {
      let presenter = mainHomePresenterClass(view: viewController)
      viewController.presenter = presenter
      
    }
    
}
