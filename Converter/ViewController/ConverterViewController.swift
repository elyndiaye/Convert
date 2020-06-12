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
        print ("From")
        let controller = ConverterListViewController(isSelectedTable: true){ text in
            self.textFrom = text
            self.screenConverter.valueLbl.text = text
        }
       self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func pressToBtn() {
        print("To")
        let controller = ConverterListViewController(isSelectedTable: true){ text in
            self.textTo = text
            self.screenConverter.valueToLbl.text = text
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func ExchangeBtn() {
        print("Exchange")
        
        viewModel.getDataFromAPI { (item) in
            //MARK: -- DispatchBackground - CoreData DispatchQueue.global(qos: .background).async
            DispatchQueue.main.async {
                if let liveQuotes = item.quotes, !liveQuotes.isEmpty {
                    self.viewModel.convertValue(item: item, from: self.textFrom, to: self.textTo)
                } else {
                    print("ApagA")
                }
            }
            
        }
        
    }
    
    
}

