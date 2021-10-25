//
//  AppWidget.swift
//  AppWidget
//
//  Created by Subhra Roy on 23/10/21.
//

import WidgetKit
import SwiftUI
import Intents


struct AppWidgetEntryView : View {
    var entry: WidgetProvider.Entry
    
    @Environment(\.widgetFamily) var widgetFamily
    
    private var fontStyle: Font{
        if widgetFamily != .systemSmall{
            return .system(Font.TextStyle.headline, design: Font.Design.rounded)
        }else{
            return .system(Font.TextStyle.title, design: Font.Design.rounded)
        }
    }
    
    var body: some View {
        //Text(entry.serviceName)
       // GeometryReader { geometry in
            ZStack{
                Shared.backgroundGradient
                VStack {
                    Image("pngegg")
                        .resizable()
                        .frame(width: widgetFamily != .systemSmall ? 100 : 70,
                               height: widgetFamily != .systemSmall ? 100 : 70,
                           alignment: .center)
                    Text(entry.serviceName)
                        .foregroundColor(.white)
                        .font(fontStyle)
//                        .background(
//                            Color(red: 0, green: 0, blue: 0, opacity: 0.7)
//                        ).blendMode(.overlay)
//                        .clipShape(Capsule())
                }
                
            } //: ZStack
        //} //: Geomatry Reader
    }
}

@main
struct AppWidget: Widget {
    let kind: String = "AppWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: WidgetProvider()) { entry in
            AppWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("App Widget")
        .description("Your latest service.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct AppWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppWidgetEntryView(entry: WidgetModelEntry(date: Date(), serviceName: "MPS", serviceDes: "", configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            AppWidgetEntryView(entry: WidgetModelEntry(date: Date(), serviceName: "MPS", serviceDes: "", configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            AppWidgetEntryView(entry: WidgetModelEntry(date: Date(), serviceName: "MPS", serviceDes: "", configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
