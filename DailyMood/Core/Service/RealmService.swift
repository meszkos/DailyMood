//
//  RealmService.swift
//  DailyMood
//
//  Created by MacOS on 15/06/2022.
//

import Foundation
import RealmSwift

class RealmService: ObservableObject{
    private(set) var localRealm: Realm?
    
    @Published private var dailyMoods: [DayMood] = []
    
    init(){
        openRealm()
    }
    
    func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        }catch{
            print("error opening Realm: \(error)")
        }
    }
    
    func addMood(date: String, moodScore: Double, positive: String, challange: String){
        if let localRealm = localRealm{
            do{
                try localRealm.write{
                    let newMood = DayMoodData(value: ["date": date,
                                                      "moodScore": moodScore,
                                                      "positive": positive,
                                                      "challange": challange])
                    localRealm.add(newMood)
                    print("Added new Mood")
                }
            }catch{
                print("error adding to realm")
            }
        }
    }
    
}
