//
//  CurrencyDetails.swift
//  CurrencyApp
//
//  Created by aya on 12/06/2023.
//

import UIKit

class CurrencyDetails: UIViewController {

    @IBOutlet weak var currencyListTableView: UITableView!
    @IBOutlet weak var baseVal: UILabel!
    
    var currencyListNmaes : [String] = []
    var currencyListValues : [Double] = []
    var base = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        baseVal.text = "1" + " " + base + " " +  "equal:"
        let nib = UINib(nibName: "currencyCell", bundle: nil)
        currencyListTableView.register(nib, forCellReuseIdentifier: "currencyCell")
        currencyListTableView.reloadData()
    }
    

    @IBAction func backAction(_ sender: Any) {
   
        self.dismiss(animated: true)
    }
    
}

extension CurrencyDetails: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyListNmaes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell") as! currencyCell

            cell.setData(name: currencyListNmaes[indexPath.row], value: currencyListValues[indexPath.row])
        return cell
    }
    
    
}
