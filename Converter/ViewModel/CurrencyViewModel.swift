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
    
    
    func getDataFromAPI(completionBlock : @escaping completionBlock){
        
        service.getItens(){(result) in
            if case .success(let items) = result {
                completionBlock(items)
            }
        }
    }
}
