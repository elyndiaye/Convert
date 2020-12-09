//
//  ConverterView.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 06/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit
import SnapKit

final class ConverterView: UIView{
    
    weak var delegate: ExchangeDelegate?
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.isScrollEnabled = true
        return view
    }()
    
    lazy var viewMain: UIView = {
           let view = UIView(frame: .zero)
        view.backgroundColor = .white
           return view
       }()
    
    lazy var viewBack: ConvertViewField = {
        let view = ConvertViewField()
        view.setView(type: .from)
        view.actionButton.addTarget(self, action: #selector(fromBtnPressed), for: .touchUpInside)
        return view
    }()
    
    
    lazy var origemLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 40)
        view.textColor = .black
        view.text = "Converter"
        return view
    }()
    
    
    
    lazy var viewBackTo: ConvertViewField = {
        let view = ConvertViewField()
        view.setView(type: .to)
        view.actionButton.addTarget(self, action: #selector(toBtnPressed), for: .touchUpInside)
        return view
    }()
    
    
    lazy var viewValueExchange: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.cinza()
        view.layer.cornerRadius = 20
        return view
    }()
    
    
    lazy var ButtonValueExchange: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Exchange", for: .normal)
        view.addTarget(self, action: #selector(exchange), for: .touchUpInside)
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var ValueExchangeLbl: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 25)
        view.textColor = .black
        view.text = "Value To Exchange:"
        return view
    }()
    
    
    lazy var valeuFromExchange: UITextField = {
        let view = UITextField(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 35)
        view.placeholder = "Ex: 23"
        view.textColor = .gray
        view.backgroundColor = .white
        return view
    }()
    
    lazy var finalValue: UILabel = {
           let view = UILabel(frame: .zero)
           view.font = UIFont.systemFont(ofSize: 35)
           view.textColor = .red
           view.text = ""
           return view
       }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ConverterView: CodeView{
    func buildViewHierarchy() {
        //Adicionar View
        addSubview(scrollView)
        scrollView.addSubview(viewMain)
        viewMain.addSubview(origemLbl)
        
        viewMain.addSubview(viewBack)
        
        viewMain.addSubview(viewBackTo)
        
        viewValueExchange.addSubview(ValueExchangeLbl)
        viewValueExchange.addSubview(ButtonValueExchange)
        viewValueExchange.addSubview(valeuFromExchange)
        viewMain.addSubview(viewValueExchange)
        viewMain.addSubview(finalValue)
    }
    
    func setupConstraints() {
        //Configurar Constraints
        //Snapkit
        
        scrollView.snp.makeConstraints { make in
            
            make.edges.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            
        }
                
        viewMain.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.width.height.top.bottom.equalTo(self.scrollView)
        }
        
        origemLbl.snp.makeConstraints { make in
            make.top.equalTo(self.scrollView).offset(20)
            make.centerX.equalTo(viewMain)
        }
        
        viewBack.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView).offset(80)
            make.centerX.equalTo(viewMain)
            make.height.equalTo(150)
            make.left.right.equalTo(viewMain)
        }
        
        
        viewBackTo.snp.makeConstraints { (make) in
            make.top.equalTo(viewBack.snp.bottom).offset(55)
           make.centerX.equalTo(viewMain)
            make.height.equalTo(150)
            make.left.right.equalTo(viewMain)
        }
        
        
        
        viewValueExchange.snp.makeConstraints { (make) in
            make.top.equalTo(viewBackTo.snp.bottom).offset(55)
            make.centerX.equalTo(viewMain)
            make.height.equalTo(160)
            make.left.right.equalToSuperview()
        }
        
        ValueExchangeLbl.snp.makeConstraints { make in
            make.top.equalTo(viewValueExchange).offset(20)
            make.centerX.equalTo(viewMain)
        }
        
        valeuFromExchange.snp.makeConstraints { make in
            make.top.equalTo(ValueExchangeLbl).offset(40)
            make.width.equalTo(150)
            make.centerX.equalTo(viewMain)
        }
        
        ButtonValueExchange.snp.makeConstraints { make in
            make.top.equalTo(valeuFromExchange).offset(55)
            make.centerX.equalTo(viewMain)
        }
        
        finalValue.snp.makeConstraints { make in
            make.top.equalTo(viewValueExchange.snp_bottomMargin).offset(10)
            make.centerX.equalToSuperview()
        }
        
        
        
      
    }
    
    func setupAdditionalConfiguration() {
        //Setup adicional
    }
    
}


//MARK - ExchangeBtnPressed
extension ConverterView{
    @objc
    func fromBtnPressed() {
        delegate?.pressFromBtn()
    }
    
    @objc
    func toBtnPressed() {
        delegate?.pressToBtn()
    }

    @objc
    func exchange() {
        delegate?.ExchangeBtn()
    }

}
