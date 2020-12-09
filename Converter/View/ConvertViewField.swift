//
//  ConvertViwField.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 28/08/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

enum ConvertViewFieldType {
    case to
    case from
}

final class ConvertViewField: UIView{
    
    
    lazy var titleLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 25)
        view.textColor = .black
        
        return view
    }()
    
    lazy var valueLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 35)
        view.textColor = .red
        
        return view
    }()
    
    
    lazy var actionButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "search_icon"), for: .normal)
        // view.addTarget(self, action: #selector(toBtnPressed), for: .touchUpInside)
        return view
    }()
    
    
    func setView(type: ConvertViewFieldType){
        switch type {
        case .to:
            titleLbl.text = "To"
            valueLbl.text = "ValeuTo"
        case .from:
            titleLbl.text = "From"
            valueLbl.text = "ValueFrom"
        }
    }
    
     override init(frame: CGRect = .zero) {
           super.init(frame: frame)
           backgroundColor = .white
           setupView()
           
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
}

extension ConvertViewField: CodeView{
    
    
    func buildViewHierarchy() {
        //Adicionar View
        addSubview(titleLbl)
        addSubview(valueLbl)
        addSubview(actionButton)
    }
    
    func setupConstraints() {
        //Configurar Constraints
        //Snapkit
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(55)
        }

        actionButton.snp.makeConstraints { make in
            make.top.equalTo(titleLbl).offset(55)
            make.left.equalTo(titleLbl)
        }


        valueLbl.snp.makeConstraints { make in
            make.top.equalTo(actionButton)
            make.left.equalTo(actionButton).offset(60)
        }
        
    }
    func setupAdditionalConfiguration() {
        self.backgroundColor = UIColor.cinza()
        self.layer.cornerRadius = 20
    }
}
