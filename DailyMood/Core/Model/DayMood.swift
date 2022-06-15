//
//  DayMood.swift
//  DailyMood
//
//  Created by MacOS on 14/06/2022.
//
import Foundation
import RealmSwift

struct DayMood: Identifiable, Decodable{

    var id: String = UUID().uuidString
    var date: String
    var positive: String
     var challange: String
    var moodScore: Double
}

class DayMoodData: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var date: String
    @Persisted var positive: String
    @Persisted var challange: String
    @Persisted var moodScore: Double
}
