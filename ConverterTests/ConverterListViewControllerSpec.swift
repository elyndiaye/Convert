//
//  ConverterListViewSpec.swift
//  ConverterTests
//
//  Created by ely.assumpcao.ndiaye on 14/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots
@testable import Converter

class ConverterListViewControllerSpec: QuickSpec {
    override func spec() {
        var controller: ConverterListViewController!
        describe("ConverterListViewControllerSpec") {
            
            beforeEach {
                controller = ConverterListViewController(isSelectedTable: false)
                controller.viewModel.service = ConvertServiceMock()
                controller.beginAppearanceTransition(true, animated: false)
                controller.endAppearanceTransition()
            }
            
            it("should have a valid instance") {
                expect(controller).toNot(beNil())
            }

            it("should have the expected number of Items") {
                expect(controller.viewModel.item.count).to(equal(1))
            }
        }
    }
}
