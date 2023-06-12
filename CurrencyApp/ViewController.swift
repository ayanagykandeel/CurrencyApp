//
//  ViewController.swift
//  CurrencyApp
//
//  Created by aya on 12/06/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func detailsVcAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "") as! CurrencyDetails
        self.present(vc, animated: true)
    }
    
}

