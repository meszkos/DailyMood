//
//  HomeViewModel.swift
//  DailyMood
//
//  Created by MacOS on 20/06/2022.
//

import Foundation
import UserNotifications
import SwiftUI


class HomeViewModel: ObservableObject{
    
    
    func getSong() -> URL{
        return URL(string: K.songs.randomElement()!)!
    }
    
    func getImage() -> Image{
        return K.images.randomElement()!
    }
    
    func updateQuote() -> String{
        return K.quotes.randomElement()!
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
