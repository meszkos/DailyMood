//
//  DayDetailsView.swift
//  DailyMood
//
//  Created by MacOS on 14/06/2022.
//

import SwiftUI

struct DayDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var realmService: RealmService
    
    
    var dayMood: DayMood
    
    var body: some View {
        if !dayMood.isInvalidated{
            VStack(alignment: .leading){
                
                buttonStack
                Divider()
                moodScoreLabel
                    

                Text("Positive things:")
                    .font(.largeTitle).bold()
                Text("\(dayMood.positive)")
                    .padding()
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .background(Color.lightGray)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color.primary.opacity(0.1), radius: 10, x: 0, y: 5)
                Text("Challanges:")
                    .font(.largeTitle).bold()
                Text("\(dayMood.challange)")
                    .padding()
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .background(Color.lightGray)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color.primary.opacity(0.1), radius: 10, x: 0, y: 5)
                
                Spacer()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .padding()
        }
    }
}

struct DayDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DayDetailsView(dayMood: DayMood())
    }
}

extension DayDetailsView{
    
    var buttonStack: some View{
        HStack{
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 25))
                    .foregroundColor(.moodBlue)
            }
            Spacer()
            Text(dayMood.date)
                .font(.system(size: 25))
                .bold()
            Spacer()
            
            Button {
                    presentationMode.wrappedValue.dismiss()
                    realmService.deleteDay(id: dayMood.id)
                
            } label: {
                Image(systemName: "trash")
                    .font(.system(size: 25))
                    .foregroundColor(.red)
            }
  
        }
        .padding(.bottom, 20)
        
    }
    var moodScoreLabel: some View{
        HStack{
            Spacer()
            Circle()
                .strokeBorder(
                    AngularGradient(gradient: Gradient(colors: [.moodRed,.moodBlue,.moodBlue, .moodGreen,.moodGreen,.moodRed]),
                                    center: .center, startAngle: .zero, endAngle: .degrees(360)),
                                    lineWidth: 17
                    )
                .frame(width: 200, height: 200)
                .overlay {
                    Text(String(format: "%.1f", dayMood.moodScore))
                        .font(.system(size: 50)).bold()
                        .foregroundColor(getColor(dayMood.moodScore))
                }
            Spacer()
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

}

