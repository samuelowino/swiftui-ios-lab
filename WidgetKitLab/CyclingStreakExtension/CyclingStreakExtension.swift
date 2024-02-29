//
//  CyclingStreakExtension.swift
//  CyclingStreakExtension
//
//  Created by Samuel Owino on 11/02/2024.
//
import WidgetKit
import SwiftUI
import AppIntents
import Charts
struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 60 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        return Timeline(entries: entries, policy: .atEnd)
    }
}
struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}
struct MonthlyHoursOfSunshine: Identifiable {
    var id: UUID = UUID()
    var city: String
    var date: Date
    var hoursOfSunshine: Double
    init(city: String, month: Int, hoursOfSunshine: Double) {
        let calendar = Calendar.autoupdatingCurrent
        self.city = city
        self.date = calendar.date(from: DateComponents(year: 2020, month: month))!
        self.hoursOfSunshine = hoursOfSunshine
    }
}
struct CyclingStreakExtensionEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry
    @State var data: [MonthlyHoursOfSunshine] = [
        MonthlyHoursOfSunshine(city: "Seattle", month: 1, hoursOfSunshine: 74),
        MonthlyHoursOfSunshine(city: "Cupertino", month: 1, hoursOfSunshine: 196),
        MonthlyHoursOfSunshine(city: "Seattle", month: 12, hoursOfSunshine: 62),
        MonthlyHoursOfSunshine(city: "Cupertino", month: 12, hoursOfSunshine: 199)
    ]
    var body: some View {
        VStack {
            Chart(data) {
                LineMark(
                    x: .value("Month", $0.date),
                    y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                )
                .foregroundStyle(by: .value("City", $0.city))
            }
        }
    }
}
struct CyclingStreakExtension: Widget {
    let kind: String = "CyclingStreakExtension"
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            CyclingStreakExtensionEntryView(entry: entry)
                .containerBackground(.fill.tertiary , for: .widget)
        }
        .supportedFamilies([.systemSmall])
    }
}
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("Configure Your Widget")
    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
    @Parameter(title: "AM/PM", default: "AM")
    var timeDisplayMode: String
}
//Preview Code from here
extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        intent.timeDisplayMode = "AM"
        return intent
    }
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        intent.timeDisplayMode = "PM"
        return intent
    }
}
#Preview(as: .systemSmall) {
    CyclingStreakExtension()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
