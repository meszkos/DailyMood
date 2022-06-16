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
        VStack(alignment: .leading){
            buttonStack
            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .padding()
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
            Button {
                realmService.deleteDay(id: dayMood.id)
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                Image(systemName: "trash")
                    .font(.system(size: 25))
                    .foregroundColor(.red)
            }
  
        }
        .padding(.bottom, 20)
    }
}
