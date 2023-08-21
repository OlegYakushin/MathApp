//
//  ChatGroupView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 8/5/23.
//

import SwiftUI

struct ChatGroupView: View {
    @Environment(\.dismiss) var dismiss
    @State var lesson: String
    @State var lessonDesc: String
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2)
            
            VStack{
                ZStack{
                    
                    Image("LevelImg")
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: UIScreen.main.bounds.width,height: 150)
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        HStack{
                            Image(systemName: "chevron.backward")
                                .bold()
                                .foregroundColor(.black)
                            Text("Back")
                                .bold()
                                .foregroundColor(.black)
                        }
                    }
                           
                    )
                    .offset(x: -150, y: 0)
                    HStack{
                        Text(lesson)
                            .font(Font.system(size: 20))
                            .bold()
                            .offset(x: 0, y: 50)
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    
                }
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Group lesson")
                            .font(Font.system(size: 20))
                            .frame(height: 80)
                        Spacer()
                    }
                    
                    Text(lessonDesc)
                        .font(Font.system(size: 24))
                        .bold()
                        .frame(height: 50)
                }
                .padding(.horizontal, 30)
                VStack{
                    Button(action: {
                        
                    }, label: {
                        Capsule()
                            .frame(width: 150, height: 50)
                            .foregroundColor(Color("LightBlue"))
                            .overlay(
                                Text("Start lesson")
                                    .foregroundColor(.black)
                            )
                        
                        
                    }
                    )
                    .padding(.vertical, 30)
                    
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct ChatGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ChatGroupView(lesson: "Level 1", lessonDesc: "lesson decs")
    }
}
