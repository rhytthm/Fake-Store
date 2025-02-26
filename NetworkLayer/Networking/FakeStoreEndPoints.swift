//
//  FakeStoreEndPoints.swift
//  NetworkLayer
//
//  Created by RAJEEV MAHAJAN on 26/02/25.
//

import RNetworkKit

enum FakeStoreEndPoint {
    case categories
    case category(type: String, limit: Int?, sort: String?)
}

extension FakeStoreEndPoint: EndPoint {
    var method: RNetworkKit.RequestMethod {
        .get
    }
    
    var baseUrl: String {
        return "fakestoreapi.com"
    }
    
    var headers: [String : String]? {
        switch self {
        case .categories:
            return nil
        case .category(type: let type):
            return nil
        }
    }
    
    var bodyParams: [String : String]? {
        switch self {
        case .categories:
            return nil
        case .category(type: let type):
            return nil
        }
    }
    
    var queryParams: [String : String]? {
        switch self {
        case .categories:
            return nil
        case .category(type: let type, limit: let limit, sort: let sort):
            var params: [String: String] = [:]
            params["limit"] = String(limit ?? 10)
            params["sort"] = sort ?? "asc"
            return params
        }
    }

    var scheme: String {
        return "https"
    }

    var path: String {
        switch self {
        case .categories:
            return "/products/categories"
        case .category(type: let type, limit: let limit, sort: let sort):
            return "/products/category/" + type
        }
    }
}
