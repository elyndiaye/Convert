//
//  CurrencyViewModel.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 07/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

class CurrencyViewModel {
    typealias completionBlock = (Currency) -> ()
    var service: ItemService = ItemServiceImpl()
 
    var filteredItems = [Currency]()
    var item = [Currency]()
    
    func getDataFromAPI(completionBlock : @escaping completionBlock){
        
        service.getItens(){(result) in
            if case .success(let items) = result {
                self.item = [items]
                completionBlock(items)
            }
        }
    }
    
       func getFiltredQuotes(searchText: String){
    //    filteredItems = item.filter({ $0.quotes?.lowercased().range(of: searchText.lowercased()) != nil })
        }
}
