//
//  SelectedCategoryVM.swift
//  NetworkLayer
//
//  Created by RAJEEV MAHAJAN on 26/02/25.
//

import Foundation
import RNetworkKit

protocol SelectedCategoryVCProtocol: AnyObject {
    func productsReceived()
}

class SelectedCategoryVM {
    var products: Products = []
    let networkManager = NetworkManager()
    var delegate: SelectedCategoryVCProtocol?
    
    func getProducts(for category: String, limit: Int? = nil, sort: String? = nil){
        networkManager.sendRequest(endpoint: FakeStoreEndPoint.category(type: category, limit: limit, sort: sort)) { (response:Result<Products, Error>) in
            switch response {
            case .success(let products):
                self.products = products
                DispatchQueue.main.async {
                    self.delegate?.productsReceived()
                }
                print("products fetched")
            case .failure(let error):
                print("Error---->", error)
            }
        }
    }
}
