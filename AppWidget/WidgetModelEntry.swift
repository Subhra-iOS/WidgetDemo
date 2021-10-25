//
//  WidgetModelEntry.swift
//  AppWidgetExtension
//
//  Created by Subhra Roy on 25/10/21.
//

import WidgetKit
import Intents

struct WidgetModelEntry: TimelineEntry {
    let date: Date
    let serviceName: String
    let serviceDes: String
    let configuration: ConfigurationIntent
    
    static let services: [WidgetModelEntry] = [
        WidgetModelEntry(date: Date(), serviceName: "MPS", serviceDes: "A test", configuration: ConfigurationIntent()),
        WidgetModelEntry(date: Date(), serviceName: "PRINT", serviceDes: "A test print", configuration: ConfigurationIntent())
    ]
}

