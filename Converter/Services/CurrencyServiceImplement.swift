//
//  CurrencyServiceImplement.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 07/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

protocol ItemService {
    func getItens(completionHandler: @escaping (Result<Currency, NetworkErrors>) -> Void )
    func getLiveQuotes(completionHandler: @escaping (Result<LiveQuote, NetworkErrors>) -> Void )
}

class ItemServiceImpl: ItemService {
    let baseURL = ConverterConstants.baseUrl.rawValue
    let list = ConverterConstants.list.rawValue
    let live = ConverterConstants.live.rawValue
    let accessKey = ConverterConstants.accessKey.rawValue
    let key = ConverterConstants.key.rawValue
    
    var apiCLiente = APIClient()
    
    static let instance = ItemServiceImpl()
    
    var currencies = [Currency]()
    
    func getItens(completionHandler: @escaping (Result<Currency, NetworkErrors>) -> Void ) {
        apiCLiente.fetchData(url: "\(baseURL)\(list)?\(accessKey)=\(key)") { (response) in
            switch response{
            case .success(let data):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let decodedItens = try? decoder.decode(Currency.self, from: data) else {
                    completionHandler(.failure(.invalidData))
                    return
                }
                //completion
                completionHandler(.success(decodedItens))
            case .failure(let error):
                debugPrint(error)
                completionHandler(.failure(.invalidResponse))
            }
            
        }
    }
    
    func getLiveQuotes(completionHandler: @escaping (Result<LiveQuote, NetworkErrors>) -> Void ) {
           apiCLiente.fetchData(url: "\(baseURL)\(live)?\(accessKey)=\(key)") { (response) in
               switch response{
               case .success(let data):
                   let decoder = JSONDecoder()
                   decoder.keyDecodingStrategy = .convertFromSnakeCase
                   guard let decodedItens = try? decoder.decode(LiveQuote.self, from: data) else {
                       completionHandler(.failure(.invalidData))
                       return
                   }
                   print(decodedItens)
                   //completion
                   completionHandler(.success(decodedItens))
               case .failure(let error):
                   debugPrint(error)
                   completionHandler(.failure(.invalidResponse))
               }
               
           }
       }
    
//    func getCategory(completionHandler: @escaping (Result<[Release], Error>) -> Void , releaseArray: [Release] ){
//        apiCLiente.fetchData(url: CATEGORY_URL) { (response) in
//            switch response{
//            case .success(let data):
//                let decoder = JSONDecoder()
//                guard let categores = try? decoder.decode([Category].self, from: data) else {
//                    completionHandler(.failure(RequestError.decoded))
//                    return
//                }
//                var releases: [Release] = []
//                for var release in releaseArray {
//                    release.categoriaNome = categores.first(where: { (category) -> Bool in
//                        return category.id == release.categoria
//                        })?.nome
//                    releases.append(release)
//                }
//                completionHandler(.success(releases))
//
//            case .failure(let error):
//                completionHandler(.failure(error))
//            }
//
//        }
//    }
    
}

