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
    
    @Published private(set) var dailyMoods: [DayMoodData] = []
    
    init(){
        openRealm()
        getDays()
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
                                        getDays()
                }
            }catch{
                print("error adding to realm")
            }
        }
    }
    func getDays(){
        if let localRealm = localRealm {
            let allDays = localRealm.objects(DayMoodData.self).sorted(byKeyPath: "date")
            dailyMoods = []
            allDays.forEach{day in
                dailyMoods.append(day)
            }
        }
    }
    func deleteDay(id: ObjectId){
        if let localRealm = localRealm {
            do{
                let dayToDelete = localRealm.objects(DayMoodData.self).filter(NSPredicate(format: "id == %@", id))
                guard !dayToDelete.isEmpty else {return}
                
                try localRealm.write{
                    localRealm.delete(dayToDelete)
                    getDays()
                }
            }catch{
                print("error deleting task")
            }
        }
    }
    
}
