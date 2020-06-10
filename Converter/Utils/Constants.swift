//
//  Constants.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 06/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

enum ConverterConstants: String {
    case baseUrl = "http://api.currencylayer.com/"
    case accessKey = "access_key"
    case key = "5007ff0fc8da9ec5613e5d195eb09e05"
    case live = "live"
    case list = "list"
}

enum NetworkErrors: String, Error {
    case invalidUrl = "This URL is invalid request. Please email us."
    case unableToComplete = "Unable to completed your request. Please check your internet"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
}

enum RequestError: Error {
    case api(error: Error)
}
