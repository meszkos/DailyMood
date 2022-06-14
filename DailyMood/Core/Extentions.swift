//
//  Extentions.swift
//  DailyMood
//
//  Created by MacOS on 14/06/2022.
//

import Foundation
import SwiftUI

extension View{
    func endTextEditing(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
