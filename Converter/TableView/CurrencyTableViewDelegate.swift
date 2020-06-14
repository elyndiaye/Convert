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
    let items:[(key: String, value: String)]
                        
    init(items: [String: String], delegate: ConvertSelectionDelegate){
        self.items = items.sorted(by:{
            $0.key < $1.key
        } )
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = items[indexPath.row].key
        let value = items[indexPath.row].value
        delegate?.didSelect(item: (key,value))
    }
    
}
