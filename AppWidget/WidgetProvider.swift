//
//  WidgetProvider.swift
//  AppWidgetExtension
//
//  Created by Subhra Roy on 25/10/21.
//

import WidgetKit
import Intents

struct WidgetProvider: IntentTimelineProvider {
    
    typealias Entry = WidgetModelEntry
    
    func placeholder(in context: Context) -> WidgetModelEntry {
       return WidgetModelEntry(date: Date(), serviceName: "MPS", serviceDes: "", configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WidgetModelEntry) -> ()) {
        let entry = WidgetModelEntry(date: Date(), serviceName: "MPS", serviceDes: "", configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [WidgetModelEntry] = WidgetModelEntry.services
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        /*for hourOffset in 0 ..< 1 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset, to: currentDate)!
            let entry = WidgetModelEntry(date: entryDate, serviceName: "", serviceDes: "", configuration: configuration)
            entries.append(entry)
        }*/
        let refreshDate: Date = Calendar.current.date(byAdding: .second, value: 5, to: currentDate)!
        let timeline = Timeline(entries: entries, policy: .after(refreshDate))
        completion(timeline)
        
    }
}
