//
//  ContentView.swift
//  DailyMood
//
//  Created by MacOS on 13/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var realmService = RealmService()
    
    var body: some View {
        MainTab()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
