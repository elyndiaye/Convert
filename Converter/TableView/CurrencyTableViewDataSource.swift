//
//  CurrencyTableView.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 07/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

final class CurrencyTableViewDataSource: NSObject, UITableViewDataSource{
    var items:[(key: String, value: String)]
    
    init(items: [String: String], tableView: UITableView){
        self.items = items.sorted(by:{
            $0.key < $1.key
        } )
    
        
        super.init()
        setupTableView(tableView)
    }
    
    private func setupTableView(_ tableView: UITableView) {
        tableView.register(cellType: ConvertListCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath,
                                                 cellType: ConvertListCell.self)
        let key = items[indexPath.row].key
        let value = items[indexPath.row].value
        cell.configureCell(item: (key,value))
        return cell
    }
}
