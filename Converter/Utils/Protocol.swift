//
//  Protocol.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 07/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

protocol ExchangeDelegate: class {
    func pressFromBtn()
    func pressToBtn()
    func ExchangeBtn()
}

protocol ConvertSelectionDelegate: class {
    func didSelect(item: (initials: String, name: String))
}
