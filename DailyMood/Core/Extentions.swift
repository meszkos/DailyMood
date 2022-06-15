//
//  Extentions.swift
//  DailyMood
//
//  Created by MacOS on 14/06/2022.
//

import Foundation
import SwiftUI


extension Color{
    static let moodRed = Color("MoodRed")
    static let moodBlue = Color("MoodBlue")
    static let moodGreen = Color("MoodGreen")
    static let lightGray = Color(UIColor.systemGray6)
}


extension View{
    func endTextEditing(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
