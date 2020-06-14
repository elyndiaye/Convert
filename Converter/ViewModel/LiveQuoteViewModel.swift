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
    
    var result: Double = 0.0
    var finalResult: Double = 0.0
    
    func getDataFromAPI(completionBlock : @escaping completionBlock){
        
        service.getLiveQuotes(){(result) in
            if case .success(let items) = result {
                completionBlock(items)
            }
        }
    }
    
    func convertValue(item : LiveQuote, from: String, to:String, value: Double){
        let USD = "USD"
        let fromUSD = USD + from
        let toUSD = USD + to
        
        guard let quotesUSDFrom = item.quotes, let valueFrom = quotesUSDFrom[fromUSD] else { return}
        
        guard let quotesUSDTo = item.quotes, let valueTo = quotesUSDTo[toUSD] else { return }
        
        if (toUSD != "USDUSD" ){
            let result = value / valueFrom
            finalResult = result * valueTo
        } else {
            finalResult = value / valueFrom
        }
        
        self.result = finalResult
    }
    
}
