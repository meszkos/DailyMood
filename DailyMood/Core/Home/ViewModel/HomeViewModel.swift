//
//  HomeViewModel.swift
//  DailyMood
//
//  Created by MacOS on 20/06/2022.
//

import Foundation


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
}
