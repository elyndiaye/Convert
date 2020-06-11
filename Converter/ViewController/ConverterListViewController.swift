//
//  ViewController.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 06/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class ConverterListViewController: UIViewController {
    
    let screenList = ConverterListView()
    
    var viewModel = CurrencyViewModel()
    
    var tableViewDataSource: CurrencyTableViewDataSource?
    var tableViewDelegate: CurrencyTableViewDelegate?
    
    let isSelectedTable: Bool
    let completion: ((String) -> Void)?
    
    override func loadView() {
        super.loadView()
        self.view = screenList
    }
    
    init(isSelectedTable: Bool, completion:  ((String) -> Void)? = nil){
        self.isSelectedTable = isSelectedTable
        self.completion = completion
        super.init(nibName : nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api()
    }
    
    //MARK: - Call API
    func api(){
        viewModel.getDataFromAPI { (item) in
            //MARK: -- DispatchBackground - CoreData DispatchQueue.global(qos: .background).async
            DispatchQueue.main.async {
                if let currencies = item.currencies, !currencies.isEmpty {
                    print(item)
                    self.screenList.load.stopAnimating()
                    self.screenList.load.isHidden = true
                    self.screenList.table.isHidden = false
                    self.setupTableView(with:currencies)
                } else {
                    self.screenList.table.isHidden = true
                }
            }
            
        }
    }
    
    //MARK: - SetupTableView
    func setupTableView(with item: [String: String]){
        tableViewDataSource = CurrencyTableViewDataSource(items: item, tableView: screenList.table)
        if isSelectedTable{
            tableViewDelegate = CurrencyTableViewDelegate(items: item, delegate: self)
        }
        
        screenList.table.dataSource = tableViewDataSource
        screenList.table.delegate = tableViewDelegate
        screenList.table.reloadData()
    }
    
}

extension ConverterListViewController: ConvertSelectionDelegate{
    func didSelect(item: (initials: String, name: String)) {
        completion?("\(item.initials)")
        print(" \(item.initials) - \(item.name)")
        navigationController?.popViewController(animated: true)
    }
}




