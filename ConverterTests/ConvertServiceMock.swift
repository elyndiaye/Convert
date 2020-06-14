//
//  ConvertServiceMock.swift
//  ConverterTests
//
//  Created by ely.assumpcao.ndiaye on 14/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

@testable import Converter

class ConvertServiceMock: ItemService {
   
    
    let items: Currency
    private let jsonHelper: JsonHelper
    
    init() {
        self.jsonHelper = JsonHelper()
        self.items = jsonHelper.decodeJson()
    }
    func getLiveQuotes(completionHandler: @escaping (Result<LiveQuote, NetworkErrors>) -> Void) {
        
    }
    
    func getItens(completionHandler: @escaping (Result<Currency, NetworkErrors>) -> Void ){
        completionHandler(.success(self.items))
    }
}
