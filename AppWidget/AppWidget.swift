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
            return .system(Font.TextStyle.largeTitle, design: Font.Design.rounded)
        }else{
            return .system(Font.TextStyle.footnote, design: Font.Design.rounded)
        }
    }
    
    var body: some View {
        //Text(entry.date, style: .time)
        GeometryReader { geometry in
            ZStack{
                Shared.backgroundGradient
                Image("pngegg")
                    .resizable()
                    .frame(width: widgetFamily != .systemSmall ? 200 : 150,
                           height: widgetFamily != .systemSmall ? 200 : 150,
                           alignment: .topLeading)
                    .padding(.top, -20)
                Text(entry.serviceName)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(fontStyle)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(
                        Color(red: 0, green: 0, blue: 0, opacity: 0.7)
                    ).blendMode(.overlay)
                    .clipShape(Capsule())
                if widgetFamily != .systemSmall{
                    Spacer()
                }
                
            } //: ZStack
        } //: Geomatry Reader
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
