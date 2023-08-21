//
//  ContentView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 7/30/23.
//

import SwiftUI

class UserData: ObservableObject {
    @AppStorage ("User Name") var user = "Robert"
}

struct ContentView: View {
    @StateObject private var userData = UserData()
    @ObservedObject var levelsViewModel = LevelsViewModel()
    @State var selectedView: String = "home"
   
    
    var body: some View {
        
  
            ZStack{
              
                
                switch selectedView {
                case "home":
                    HomeView()
                        .environmentObject(userData)
                    
                case "profile":
                    ProfileView()
                        .environmentObject(userData)
                    
                case "share":
                    GroupView()
                        .environmentObject(userData)
                    
                default:
                    Text("Invalid selection")
                }
                
                        
                VStack{
           Rectangle()
                        .foregroundColor(Color("LightBlue").opacity(0.6))
                        .blur(radius: 3)
                    .frame(width: UIScreen.main.bounds.width, height:50)
                Spacer()
            }
            .ignoresSafeArea()
                
            VStack{
                Spacer()
                TabBarView(selectedView: $selectedView)
            }
            .ignoresSafeArea()
                
           
    }
        
        
        
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

