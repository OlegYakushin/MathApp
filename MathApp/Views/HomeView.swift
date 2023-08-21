//
//  HomeView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 7/30/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var userData: UserData
    
    @ObservedObject var levelsViewModel = LevelsViewModel()
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            ScrollView(showsIndicators: false){
                VStack(spacing: 20){
                
        
                        RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .overlay(
                            Text("👋 Hello, \(userData.user)!")
                        .bold()
                    )
                    
                    ForEach(levelsViewModel.levels) { level in
                        
                        TopicView(level: level.levelname, levelDecs: level.level)
                        
                        ForEach(level.levels){ SubLevel in
                            LineView(level: SubLevel.id)
                                .padding(.vertical, -20)
                            LevelView(isActive: SubLevel.isActive,  img1: "1", img2: "2", img3: "3", img4: "4", level: level.levels, levelFeat: SubLevel.desc)
                            
                            
                        }
                        
                        
                    }
                
                  
                    
                }
            }
        }
        .onAppear {
                   levelsViewModel.loadLevelsFromJSON()
               }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserData())
    }
}
