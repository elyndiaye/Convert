//
//  CurrencyTableViewDelegate.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 07/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

final class CurrencyTableViewDelegate: NSObject, UITableViewDelegate{
    weak var delegate: ConvertSelectionDelegate?
    let items:[String: String]
                        
    init(items: [String: String], delegate: ConvertSelectionDelegate){
        self.items = items
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = Array(items.keys)[indexPath.row]
        let value = Array(items.values)[indexPath.row]
        delegate?.didSelect(item: (key,value))
    }
    
}
