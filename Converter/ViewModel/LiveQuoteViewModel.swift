//
//  LiveQuoteViewModel.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 11/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

class LiveQuoteViewModel {
    typealias completionBlock = (LiveQuote) -> ()
    var service: ItemService = ItemServiceImpl()
    
    
    func getDataFromAPI(completionBlock : @escaping completionBlock){
        
        service.getLiveQuotes(){(result) in
            if case .success(let items) = result {
                completionBlock(items)
            }
        }
    }
    
    func convertValue(item : LiveQuote, from: String, to:String){
        let USD = "USD"
        let fromUSD = USD + from
        let toUSD = USD + to
        
        print(toUSD)
        
        guard let newItem = item.quotes else {return}
        
//        if(toUSD == newItem.keys){
//
//        }
        
        print (item.quotes?.keys)
    }
    
}
