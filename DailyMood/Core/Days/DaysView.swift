//
//  DaysView.swift
//  DailyMood
//
//  Created by MacOS on 14/06/2022.
//

import SwiftUI

struct DaysView: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                NavigationLink {
                    AddDayView()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.moodBlue)
                }

            }
            HStack{
                Text("Daily Mood")
                    .font(.largeTitle).bold()
                    .foregroundColor(.black)
                Spacer()
            }
            ScrollView{
                VStack(spacing: 0){
                    DayRowView(dayMood: DayMood(date: "11/10/20", positive: "si", challange: "no", moodScore: 79))
                    DayRowView(dayMood: DayMood(date: "10/10/20", positive: "si", challange: "no", moodScore: 20))
                    DayRowView(dayMood: DayMood(date: "09/10/20", positive: "si", challange: "no", moodScore: 80))
                    DayRowView(dayMood: DayMood(date: "08/10/20", positive: "si", challange: "no", moodScore: 21))
                    DayRowView(dayMood: DayMood(date: "07/10/20", positive: "si", challange: "no", moodScore: 53))
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.primary.opacity(0.1), radius: 10, x: 0, y: 5)
            Spacer()
        }
        .padding()
        
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView()
    }
}
