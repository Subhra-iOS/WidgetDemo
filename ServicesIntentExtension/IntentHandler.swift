//
//  IntentHandler.swift
//  ServicesIntentExtension
//
//  Created by Subhra Roy on 27/10/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Intents

class IntentHandler: INExtension, ConfigurationIntentHandling{
    
    func provideServicesOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<ServiceType>?, Error?) -> Void) {
        ServiceApi.fetchAllServices { (result) in
            switch result {
                case .success(let services):
                    let serviceParams = services.map { ServiceType(services: $0) }
                    completion(
                        INObjectCollection(sections: [
                           // INObjectSection(title: "Global", items: [ServiceType.globalService]),
                            INObjectSection(title: "Services", items: serviceParams)
                        ])
                        , nil)
                    
                    
                case .failure(_):
                    completion(
                        INObjectCollection(items: [ServiceType.globalService])
                        , nil)
            }
        }
    }
    
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
