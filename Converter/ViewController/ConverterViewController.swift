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
            self.screenConverter.valueLbl.text = text
        }
       self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func pressToBtn() {
        print("To")
        let controller = ConverterListViewController(isSelectedTable: true){ text in
            self.screenConverter.valueToLbl.text = text
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func ExchangeBtn() {
        print("Exchange")
        //present
    }
    
    
}

