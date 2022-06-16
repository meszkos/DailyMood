//
//  MainTab.swift
//  DailyMood
//
//  Created by MacOS on 14/06/2022.
//

import SwiftUI

struct MainTab: View {
    
    @State private var selectedIndex = 0
    @StateObject var realmService = RealmService()
    
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            HomeView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                        
                }.tag(0)
            DaysView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .environmentObject(realmService)
                .tabItem {
                    Image(systemName: "calendar")
                        
                }.tag(1)
        }
        .accentColor(Color.moodBlue)
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
