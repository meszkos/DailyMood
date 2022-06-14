//
//  DayRowView.swift
//  DailyMood
//
//  Created by MacOS on 14/06/2022.
//

import SwiftUI

struct DayRowView: View {
    
    var dayMood: DayMood
    
    var body: some View {
        VStack {
            NavigationLink {
                DayDetailsView()
            } label: {
                HStack{
                    Text(dayMood.date)
                        .padding()
                    Spacer()
                    Text(String(format: "%.1f", dayMood.moodScore))
                        .padding()
                }
                .background(getColor(dayMood.moodScore))
                .foregroundColor(.white)
                .font(.system(size: 25))
        }
            
        }
    }
}

struct DayRowView_Previews: PreviewProvider {
    static var previews: some View {
        DayRowView(dayMood: DayMood(date: "11/01/22", positive: "rower", challange: "work", moodScore: 63.5))
    }
}

func getColor(_ moodScore: Double) -> Color{
    var color = Color.moodGreen
    
    if moodScore < 25.0{
        color = Color.moodRed
    }else if moodScore < 75.0{
        color = Color.moodBlue
    }else{
        color = Color.moodGreen
    }
    return color
}
