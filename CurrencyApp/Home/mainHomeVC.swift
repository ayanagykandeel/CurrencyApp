//
//  mainHomeVC.swift
//  CurrencyApp
//
//  Created by aya on 13/06/2023.
//

import UIKit
import DropDown


protocol homeView {


   // func reloadData()
 //   func navagateToViewController(id: String, type: String)
   
    func setupDropDown(array: [String: Double])
    func setupDropDown1(array: [String: Double])
    func reloadDataWithNewBaseCurrencies(array : [String: Double])
}

class mainHomeVC:  UIViewController , homeView{

    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var amountLbl: UITextField!

    @IBOutlet weak var drop: UITextField!
    @IBOutlet var virtView: UIView!
    
    @IBOutlet weak var drop1: UITextField!
    @IBOutlet var virtView1: UIView!

    @IBOutlet var detailsBtn: UIButton!

    private var configurator: mainHomeConfigurator = mainHomeConfiguratorImplementation()
    var presenter: mainHomePresenter!
    let defaults = UserDefaults.standard
    let dropDown = DropDown()
    let dropDown1 = DropDown()
    var farray : [Double] = []
    var farray1 : [Int] = []
    var selectedCurrencyFrom = 0.0
    var selectedCurrencyName = ""
    var newUpdatedCurrencies : [String: Double] = [:]
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configurator.configure(viewController: self)
        presenter.getAllCurrencies()
    
    }
    
    
    func setupDropDown(array: [String: Double]) {

        dropDown.anchorView = virtView

        var names : [String] = []
        for item in array.keys {
            names.append(item)
        }
        for item in array.values {
            farray.append(item)
        }
        
        dropDown.dataSource = names
        dropDown.direction = .bottom
        dropDown.width = virtView.frame.width
        dropDown.bottomOffset.y = drop.bounds.height + 2
        dropDown.offsetFromWindowBottom = view.frame.height * 0.2

        DropDown.appearance().center = view.center
        DropDown.appearance().textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        DropDown.appearance().cornerRadius = 10
        DropDown.appearance().backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        DropDown.appearance().center = view.center

    }

    @IBAction func showCat(_ sender: Any) {
        dropDown.show()
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            selectedCurrencyName = item
            drop.text =  item
            presenter.getAllCurrenciesByBase(base: item)
            

        }
    }
    
    func setupDropDown1(array: [String: Double]) {

        dropDown1.anchorView = virtView

        var names : [String] = []
        for item in array.keys {
            names.append(item)
        }
        
        dropDown1.dataSource = names
        dropDown1.direction = .bottom
        dropDown1.width = virtView1.frame.width
        dropDown1.bottomOffset.y = drop1.bounds.height + 2
        dropDown1.offsetFromWindowBottom = view.frame.height * 0.2

        DropDown.appearance().center = view.center
        DropDown.appearance().textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        DropDown.appearance().cornerRadius = 10
        DropDown.appearance().backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        DropDown.appearance().center = view.center

    }

    @IBAction func showCat1(_ sender: Any) {
        dropDown1.show()
        dropDown1.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            drop1.text =  item
            
            for i in newUpdatedCurrencies{
                if item == i.key {
                    print(i.value)
                    selectedCurrencyFrom = i.value
                    flag = 1
                }
            }
        }
        
    }
    
    func reloadDataWithNewBaseCurrencies(array : [String: Double]){
        newUpdatedCurrencies = array
        flag = 0
    }

    
    @IBAction func OKAction(_ sender: Any) {

      
        resultLbl.text = ""
        if drop1.text != "" && drop.text != "" && amountLbl.text != "" {
            
            
            if flag == 0 {
                
                for i in newUpdatedCurrencies{
                    if drop1.text == i.key {
                        print(i.value)
                        selectedCurrencyFrom = i.value
                        flag = 1
                    }
                }
            }
                        
            let amountVal = Double(amountLbl.text!)
                      let total = amountVal! * selectedCurrencyFrom
                      resultLbl.isHidden = false
                      detailsBtn.isHidden = false
                      resultLbl.text = String(format: "%.2f", total)
        }
        
    }
    
    func calculateCnoversion(from: String, to: String, amount: Double){
        
        
    }
    
    @IBAction func versaViceAction(_ sender: Any) {
      //  flag = 0
//        if drop.text != "" && drop1.text != ""{
//            let txt1 = drop.text
//            let txt2 = drop1.text
//
//            drop.text = txt2
//            drop1.text = txt1
//
//
//        }
    
    }
    
    
    
    @IBAction func detailsVcAction(_ sender: Any) {
        
        let currencies = newUpdatedCurrencies.prefix(10)
        let vc = storyboard?.instantiateViewController(withIdentifier: "CurrencyDetails") as! CurrencyDetails
        for i in currencies{
            vc.currencyListNmaes.append(i.key)
            vc.currencyListValues.append(i.value)
        }
        vc.base = drop.text!
        self.present(vc, animated: true)
    }
    

}




