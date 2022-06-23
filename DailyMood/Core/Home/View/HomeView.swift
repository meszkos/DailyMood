//
//  HomeView.swift
//  DailyMood
//
//  Created by MacOS on 14/06/2022.
//

import SwiftUI
import SafariServices
import UserNotifications

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State private var isShowingImage: Bool = false
    @State private var quote = ""
    @State private var showSafari = false
    
    let timer = Timer.publish(every: 14400 ,on: .main, in: .common).autoconnect()
    
    
    init(){
        self.viewModel = HomeViewModel()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { succes, error in
            if succes{
                print("")
            }else if let error = error{
                print(error)
            }
        }
        
    }
    
    var body: some View {
        VStack{
            Spacer()
            quoteLabel
            Spacer()
            actionButtons
            
        }
        .padding()
        .padding(.bottom, 50)
        .navigationTitle("")
        .navigationBarHidden(true)
        .onChange(of: quote) { newValue in
                viewModel.configureNotification(quote: quote)
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView{
    
    var quoteLabel: some View{
        Text(quote)
            .onReceive(timer, perform: { _ in
                quote = viewModel.updateQuote()
                
            })
            .padding()
            .font(.system(size: 40))
            .multilineTextAlignment(.center)
            .background(Color.lightGray)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.primary.opacity(0.1), radius: 10, x: 0, y: 5)
    }
    
    var actionButtons: some View{
        VStack{
            Button{
                isShowingImage.toggle()
            } label: {
                Text("Get Image")
                    .frame(width: 200, height: 50)
                    .font(.system(size: 30))
                    .background(Color.white)
                    .cornerRadius(12)
                    .foregroundColor(.moodBlue)
                    
            }
            .sheet(isPresented: $isShowingImage, content: {
                RandomImageView(image: viewModel.getImage())
            })
            .padding()
            Button {
                showSafari.toggle()
            } label: {
                Text("Get Song")
                    .frame(width: 200, height: 50)
                    .font(.system(size: 30))
                    .background(Color.white)
                    .cornerRadius(12)
                    .foregroundColor(.moodGreen)
                    
            }
            .sheet(isPresented: $showSafari, content: {
                SafariView(url: viewModel.getSong())
            })
            .padding()
            Button {
                quote = viewModel.updateQuote()
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
    
}
