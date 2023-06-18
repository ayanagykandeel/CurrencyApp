//
//  currencyCell.swift
//  CurrencyApp
//
//  Created by aya on 12/06/2023.
//

import UIKit

class currencyCell: UITableViewCell {

    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencyValue: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(name:  String, value: Double){
        
        currencyName.text = name
        currencyValue.text = "\(value)"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
