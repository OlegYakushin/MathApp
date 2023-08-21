//
//  GroupLevelView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 8/5/23.
//

import SwiftUI

struct GroupLevelView: View {
    @State var lessonName: String
    @State var lessonDesc: String
    @State var image: String
    @State var isActive: Bool
    @State private var isChatViewOpen = false
    var body: some View {
        if isActive == true {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 140, height: 140)
                .foregroundColor(Color("LightBlue").opacity(0.2))
                .overlay(
                    VStack{
                        Image(image)
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(lessonName)
                        Text(lessonDesc)
                    }
                )
                .onTapGesture {
                    isChatViewOpen = true
                }
                .fullScreenCover(isPresented: $isChatViewOpen) {
                    ChatGroupView(lesson: lessonName, lessonDesc: lessonDesc)
                }
        } else {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 140, height: 140)
                .foregroundColor(Color("LightBlue").opacity(0.2))
                .opacity(0.4)
                .overlay(
                    ZStack{
                        VStack{
                            Image(image)
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(lessonName)
                            Text(lessonDesc)
                        }
                        .opacity(0.4)
                        Image(systemName: "lock")
                            .offset(x: 50, y: -50)
                    }
                )
               
            
        }
    }
        
}

struct GroupLevelView_Previews: PreviewProvider {
    static var previews: some View {
        GroupLevelView(lessonName: "Level 1", lessonDesc: "Level 1 decs", image: "1", isActive: false)
    }
}
