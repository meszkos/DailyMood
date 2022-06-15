//
//  HomeView.swift
//  DailyMood
//
//  Created by MacOS on 14/06/2022.
//

import SwiftUI

struct HomeView: View {
    
    let text = "this is a quote that is pretty long and makes good oro lets go go sir."
    
    var body: some View {
        VStack{
            Spacer()
            Text(text)
                .padding()
                .font(.system(size: 40))
                .multilineTextAlignment(.center)
                .background(Color.lightGray)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.primary.opacity(0.1), radius: 10, x: 0, y: 5)
            Spacer()
            VStack{
                Button {
                    //Image
                } label: {
                    Text("Get Image")
                        .frame(width: 200, height: 50)
                        .font(.system(size: 30))
                        .background(Color.white)
                        .cornerRadius(12)
                        .foregroundColor(.moodBlue)
                        
                }
                .padding()
                Button {
                    //Get Song
                } label: {
                    Text("Get Song")
                        .frame(width: 200, height: 50)
                        .font(.system(size: 30))
                        .background(Color.white)
                        .cornerRadius(12)
                        .foregroundColor(.moodGreen)
                        
                }
                .padding()
                Button {
                    //Get Song
                } label: {
                    Text("Get Quote")
                        .frame(width: 200, height: 50)
                        .font(.system(size: 30))
                        .background(Color.white)
                        .cornerRadius(12)
                        .foregroundColor(.moodRed)
                        
                }
                .padding()
                
                

            }
            .frame(maxWidth: .infinity)
            .background(Color.lightGray)
            .foregroundColor(.moodBlue)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.primary.opacity(0.1), radius: 10, x: 0, y: 5)
            
        }
        .padding()
        .padding(.bottom, 50)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
