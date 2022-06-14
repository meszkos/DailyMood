//
//  DayMood.swift
//  DailyMood
//
//  Created by MacOS on 14/06/2022.
//

import Foundation

struct DayMood: Identifiable, Decodable{
    
    var id: String = UUID().uuidString
    var date: String
    var positive: String
    var challange: String
    var moodScore: Double
}
