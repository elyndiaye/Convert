//
//  Quotes.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 11/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

// MARK: - Quotes
struct LiveQuote: Codable {
    let success: Bool?
    let terms, privacy: String?
    let timestamp: Int?
    let source: String?
    let quotes: [String: Double]?
}
