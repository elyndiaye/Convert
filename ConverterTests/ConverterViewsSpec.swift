//
//  ConverterViewsSpec.swift
//  ConverterTests
//
//  Created by ely.assumpcao.ndiaye on 14/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import Converter


class ItemDetailViewSpec: QuickSpec {
    override func spec() {
        describe("Screen ConverterView") {
            it("has valid snapshot") {
                let frame = UIScreen.main.bounds
                let view = ConverterView(frame: frame)
                expect(view) == snapshot("Screen ConverterView")
            }
        }
    }
}
