//
//  ServiceApi.swift
//  WidgetDemo
//
//  Created by Subhra Roy on 27/10/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation

enum ServiceError: Error{
    case invalid
    case noData
}

struct ServiceApi {
    
    static var entries: [ServiceModel]{
        return [
            ServiceModel(serviceName: "PRINT", identifier: "111"),
            ServiceModel(serviceName: "MPS", identifier: "112")
        ]
    }
    
    static func fetchAllServices(closure: (Result<[ServiceModel], ServiceError>)-> Void) -> Void{
        closure(.success(entries))
    }
}
