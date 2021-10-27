//
//  SharedContent.swift
//  WidgetDemo
//
//  Created by Subhra Roy on 25/10/21.
//

import SwiftUI
import Intents

struct Shared {
    static var backgroundGradient: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

extension ServiceType {
    
    convenience init(services: ServiceModel) {
        self.init(identifier: services.identifier, display: services.serviceName)
    }
    
    static var globalService: ServiceType {
       return  ServiceType(services: .init(serviceName: "MPS", identifier: "112"))
    }
}
