//
//  JsonHelper.swift
//  ConverterTests
//
//  Created by ely.assumpcao.ndiaye on 14/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
@testable import Converter

class JsonHelper {
    
    func loadJson() -> Data {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "currencesList", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        return try! Data(contentsOf: url)
    }
    
    func decodeJson() -> Currency {
        let data = loadJson()
        let decoder = JSONDecoder()
        let items = try! decoder.decode(Currency.self, from: data)
        return items
    }
    
}
