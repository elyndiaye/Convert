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
    
     var inSearchMode = false
    
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
        self.screenList.table.isHidden = true
        screenList.load.startAnimating()
        api()
        setupSearchBar()
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

// MARK: - UISearchDelate
extension ConverterListViewController: UISearchBarDelegate{
    func setupSearchBar() {
        self.screenList.search.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        screenList.search.resignFirstResponder()
        let query = searchBar.text ?? ""
        if !query.isEmpty {
            print(query)
          //  apiWithQueryHandler(query: query)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        screenList.search.showsCancelButton = false
        print("Cancel")
        //Verificar:
        screenList.table.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            inSearchMode = false
           // self.setupCollectionView(with: self.movie)
        } else {
            screenList.search.showsCancelButton = true
            inSearchMode = true
            print(searchText)
            viewModel.getFiltredQuotes(searchText: searchText)
          //  filteredMovie = movie.filter({ $0.title?.lowercased().range(of: searchText.lowercased()) != nil })
            //filter({$0.title.lowercased().contains(searchText.lowercased())})
            //print(filteredMovie)
           // self.setupCollectionView(with: self.filteredMovie)
        }
    }
    
}



