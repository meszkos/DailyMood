//
//  DayMood.swift
//  DailyMood
//
//  Created by MacOS on 14/06/2022.
//
import Foundation
import RealmSwift

class DayMood: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var date: String
    @Persisted var positive: String
    @Persisted var challange: String
    @Persisted var moodScore: Double
}
