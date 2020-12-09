//
//  ConverterViewController.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 06/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    let screenConverter = ConverterView()
    var viewModel = LiveQuoteViewModel()
    
    var textFrom: String = ""
    var textTo: String = ""
    
    var valueDobule: Double = 0.0
    
    override func loadView() {
        super.loadView()
        self.view = screenConverter
        screenConverter.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
}

extension ConverterViewController: ExchangeDelegate{
    func pressFromBtn() {
        let controller = ConverterListViewController(isSelectedTable: true){ text in
            self.textFrom = text
            self.screenConverter.viewBack.valueLbl.text = text
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func pressToBtn() {
        let controller = ConverterListViewController(isSelectedTable: true){ text in
            self.textTo = text
            self.screenConverter.viewBackTo.valueLbl.text = text
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func ExchangeBtn() {
        print("Exchange")
        
        //MARK: -- Validations
        if (textTo.isEmpty || textFrom.isEmpty) {
            DisplayTextField(text: "Please select Currences", message: "Por favor informar as moedas de origem e destino")
            return
        }
        
        guard let valueFromTextfield = self.screenConverter.valeuFromExchange.text, self.screenConverter.valeuFromExchange.text?.count != 0  else {
            DisplayTextField(text: "Campo vazio", message: "Por favor informar o valor!")
            return }
        
        func verify() -> Bool {
            if CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: valueFromTextfield)) {
                return true }
            else { return false }
        }
        
        if verify(){
            valueDobule = (valueFromTextfield as NSString).doubleValue
        }else{
            DisplayTextField(text: "Verify Numbuer", message: "Please only numbers in field!")
            return
        }
        
        
        viewModel.getDataFromAPI { (item) in
            //MARK: -- DispatchBackground - CoreData DispatchQueue.global(qos: .background).async
            DispatchQueue.main.async {
                if let liveQuotes = item.quotes, !liveQuotes.isEmpty {
                    self.viewModel.convertValue(item: item, from: self.textFrom, to: self.textTo, value: self.valueDobule)
                    self.screenConverter.finalValue.text = String(format: "%.2f", self.viewModel.result) + self.textTo
                } else {
                    self.DisplayTextField(text: "Oppss", message: "Please verify you connection or enter on contact by Emaill")
                }
            }
            
        }
        
    }
    
    
}

