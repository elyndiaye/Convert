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
    var currency : Currency?
    
    func getDataFromAPI(completionBlock : @escaping completionBlock){
        
        service.getItens(){(result) in
            if case .success(let items) = result {
                self.currency = items
                completionBlock(items)
            }
        }
    }
    
    func getFiltredQuotes(searchText: String) -> [String: String] {
        var filteredCurrency = [String: String]()
        if let currency = currency, let currencies = currency.currencies {
            filteredCurrency = currencies.filter({ (currency) -> Bool in
                return currency.key.lowercased().contains(searchText.lowercased())
            })
        }
        return filteredCurrency
    }
    
    func getCurrencyforButtonCancelinSearchBar() -> [String: String] {
        var newCurrency = [String: String]()
        if let currency = currency, let currencies = currency.currencies{
            newCurrency = currencies
        }
        return newCurrency
    }
}
