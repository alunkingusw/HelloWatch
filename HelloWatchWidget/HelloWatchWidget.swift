//
//  HelloWatchWidget.swift
//  HelloWatchWidget
//
//  Created by Alun King on 02/02/2026.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), timerDetails: TimerDetails(), counter:1)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        //load the model
        var timerModel = TimerModel()
        let entry = SimpleEntry(date: Date(), timerDetails:timerModel.timerDetails, counter:1)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        //load the model
        let timerModel = TimerModel()
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for secondOffset in 0 ..< 60 {
            let entryDate = Calendar.current.date(byAdding: .second, value: secondOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, timerDetails: timerModel.timerDetails, counter:secondOffset)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

//add the data here which you need
struct SimpleEntry: TimelineEntry {
    let date: Date
    let timerDetails:TimerDetails
    let counter:Int
}

struct HelloWatchWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            HStack {
                Text("Time:")
                Text(String(entry.counter))
            }
            Text(String(entry.timerDetails.timeElapsed))

        }
    }
}

@main
struct HelloWatchWidget: Widget {
    let kind: String = "HelloWatchWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(watchOS 10.0, *) {
                HelloWatchWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                HelloWatchWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Stopwatch Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .accessoryRectangular) {
    HelloWatchWidget()
} timeline: {
    SimpleEntry(date: .now, timerDetails:TimerDetails(), counter:1)
    SimpleEntry(date: .now, timerDetails:TimerDetails(), counter:1)
}
