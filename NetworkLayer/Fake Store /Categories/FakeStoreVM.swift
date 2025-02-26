//
//  FakeStoreVM.swift
//  NetworkLayer
//
//  Created by RAJEEV MAHAJAN on 26/02/25.
//

import Foundation
import RNetworkKit

protocol FakeStoreDelegate: AnyObject {
    func didUpdateCategories()
}

class FakeStoreVM {
    var categories: [String] = []
    let networkManager = NetworkManager()
    var delegate: FakeStoreDelegate?
    
    func getCategories(){
        networkManager.sendRequest(endpoint: FakeStoreEndPoint.categories) { (response:Result<[String], Error>) in
            switch response {
            case .success(let categories):
                self.categories = categories
                DispatchQueue.main.async {
                    self.delegate?.didUpdateCategories()
                }
                print("categories fetched")
            case .failure(let error):
                print("Error---->", error)
            }
        }
    }
    
    
}





