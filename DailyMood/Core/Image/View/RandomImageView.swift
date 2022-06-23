//
//  RandomImageView.swift
//  DailyMood
//
//  Created by MacOS on 23/06/2022.
//

import SwiftUI

struct RandomImageView: View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

struct RandomImageView_Previews: PreviewProvider {
    static var previews: some View {
        RandomImageView(image: Image("Portrait"))
    }
}
