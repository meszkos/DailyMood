//
//  AddDayView.swift
//  DailyMood
//
//  Created by MacOS on 14/06/2022.
//

import SwiftUI


struct AddDayView: View {
    
    @EnvironmentObject var realmService: RealmService
    @Environment(\.presentationMode) var presentationMode
    @State var positive: String = ""
    @State var challange: String = ""
    @State var moodScore: Double = 50.0
    
    var body: some View {
        VStack(alignment: .leading){
            buttonStack
            
            Text("Mood score: \(String(format: "%.0f", moodScore))")
                .font(.title).bold()
            //Slider(value: $moodScore, in: 0...100)
            slider
            
            Text("Good things from today:")
                .font(.title).bold()
            positivesTextView
            Text("Challanges:")
                .font(.title).bold()
            challangesTextView
            Spacer()
            
            
        }
        .padding()
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onTapGesture {
            self.endTextEditing()
        }
    }
}

struct AddDayView_Previews: PreviewProvider {
    static var previews: some View {
        AddDayView()
            .environmentObject(RealmService())
    }
}

extension AddDayView{
    
    var positivesTextView: some View{
        TextEditor(text: $positive)
            .multilineTextAlignment(.center)
            .frame(height: 150)
            .overlay(RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray.opacity(0.2), lineWidth: 2))
    }
    
    var challangesTextView: some View{
        TextEditor(text: $challange)
            .frame(height: 150)
            .multilineTextAlignment(.center)
            .overlay(RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray.opacity(0.2), lineWidth: 2))
    }
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
                realmService.addMood(date: getDate(),
                                     moodScore: moodScore,
                                     positive: positive,
                                     challange: challange)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("ADD")
                    .font(.system(size: 25))
                    .foregroundColor(.moodBlue)
            }

            
        }
        .padding(.bottom, 20)
    }
    
    var slider: some View{
        ZStack {
              LinearGradient(
                gradient: Gradient(colors: [.moodRed, .moodBlue, .moodGreen]),
                  startPoint: .leading,
                  endPoint: .trailing
              )
              .frame(height: 50)
              .mask(Slider(value: $moodScore, in: 0...100))

              Slider(value: $moodScore, in: 0...100)
                  .opacity(0.05)
                  
        }
    }
    
    func getDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let stringDate = dateFormatter.string(from: Date.now)
        return stringDate
    }
    
}
