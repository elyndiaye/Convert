//
//  CodeView.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 06/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

protocol CodeView{
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

//Para garantir que os metodos vao ser executados na ORDEM correta
extension CodeView{
    func setupView(){
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
