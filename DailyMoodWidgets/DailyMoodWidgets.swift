//
//  DailyMoodWidgets.swift
//  DailyMoodWidgets
//
//  Created by MacOS on 22/06/2022.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), quotes: "...")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), quotes: "...")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, quotes: DataProvider.getQuotes())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let quotes: String
}

struct DailyMoodWidgetsEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            Text(entry.quotes)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding()
                .multilineTextAlignment(.center)
        }
    }
}

@main
struct DailyMoodWidgets: Widget {
    let kind: String = "DailyMoodWidgets"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DailyMoodWidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct DailyMoodWidgets_Previews: PreviewProvider {
    static var previews: some View {
        DailyMoodWidgetsEntryView(entry: SimpleEntry(date: Date(), quotes: "Widget"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

class DataProvider{
    static func getQuotes() -> String{
        let quotes = [
            "WAGMI",
            "You are beautifull!",
            "You are important!",
            "You are loved!",
            "You are smart!",
            "You are talented!",
            "You can do it!",
            "Day by day, it will get better.",
            "Some day you will go to Japan.",
            "You are enough.",
            "You're doing great! Keep going.",
            "Im proud of you",
            "You are wanted",
            "Im proud of you.",
            "You will have enough money to do anything you want.",
            "You will be healthy",
            "Healing Takes Time",
            "I found that with depression, one of the most important things you could realize is that you’re not alone.",
            "I have depression. But I prefer to say, ‘I battle’ depression instead of ‘I suffer’ with it. Because depression hits, but I hit back. Battle on.",
            "Depression doesn't take away your talents—it just makes them harder to find.",
            "There is hope, even when your brain tells you there isn't.",
            
        ]
        return quotes.randomElement()!
    }
}
