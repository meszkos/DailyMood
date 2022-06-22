//
//  HomeViewModel.swift
//  DailyMood
//
//  Created by MacOS on 20/06/2022.
//

import Foundation
import UserNotifications


class HomeViewModel: ObservableObject{
    
    
    func getSong() -> URL{
        let len = K.songs.count
        
        let index = Int.random(in: 0...len - 1)
        
        
        return URL(string: K.songs[index])!
    }
    func updateQuote() -> String{
        let len = K.quotes.count
        let index = Int.random(in: 0...len - 1)
        
        return K.quotes[index]
    }
    
    func configureNotification(quote: String){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        let content = UNMutableNotificationContent()
        content.title = "Hi there!"
        content.subtitle = "\(quote)"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7200, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
