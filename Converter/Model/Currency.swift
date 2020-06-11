//
//  Currencies.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 07/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

// MARK: - Currency
struct Currency: Codable {
    let success: Bool?
    let terms, privacy: String?
    let currencies: [String: String]?
}
