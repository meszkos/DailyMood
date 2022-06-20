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
        let song = K.songs[index]
        
        return URL(string: song)!
        
    }
}
