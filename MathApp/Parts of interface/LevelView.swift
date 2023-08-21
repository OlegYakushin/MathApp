//
//  LevelView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 8/1/23.
//

import SwiftUI

struct LevelView: View {
    @State var isActive: Bool
    @State var img1: String
    @State var img2: String
    @State var img3: String
    @State var img4: String
    @State var level: [SubLevel]
    @State var levelFeat: String
    @State private var selected: Int = 1
    @State private var isChatViewOpen = false
    var body: some View {
        if isActive == true{
         
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 300, height: 300)
                .foregroundColor(Color("LightBlue").opacity(0.2))
                .overlay(
                    VStack{
                        HStack{
                            Image(img1)
                                .resizable()
                                .frame(width: selected == 0 ? 80 : 50, height: selected == 0 ? 80 : 50)
                                .cornerRadius(20)
                                .padding(.horizontal, 20)
                                .colorMultiply(selected == 0 ? .white : .gray)
                                .onTapGesture {
                                    selected = 0
                                }
                            Image(img2)
                                .resizable()
                                .frame(width: selected == 1 ? 80 : 50, height: selected == 1 ? 80 : 50)
                                .cornerRadius(20)
                                .padding(.horizontal, 20)
                                .colorMultiply(selected == 1 ? .white : .gray)
                                .onTapGesture {
                                    selected = 1
                                }
                            
                           
                        }
                        
                        HStack{
                            Image(img3)
                                .resizable()
                                .frame(width: selected == 2 ? 80 : 50, height: selected == 3 ? 80 : 50)
                                .cornerRadius(20)
                                .padding(.horizontal, 20)
                                .colorMultiply(selected == 2 ? .white : .gray)
                                .onTapGesture {
                                    selected = 2
                                }
                            
                        
                            
                            Image(img4)
                                .resizable()
                                .frame(width: selected == 3 ? 80 : 50, height: selected == 4 ? 80 : 50)
                                .cornerRadius(20)
                                .padding(.horizontal, 20)
                                .colorMultiply(selected == 3 ? .white : .gray)
                                .onTapGesture {
                                    selected = 3
                                }
                        }
                        HStack{
                            Text(level[selected].levelFeatures)
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal)
                        HStack{
                        Text(level[selected].desc)
                        Spacer()
                    }
                        .padding(.horizontal)
                        Button(action: {
                            isChatViewOpen = true
                        }, label: {
                            Capsule()
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color("LightBlue"))
                                .overlay(
                            Text("Start")
                                .foregroundColor(.black)
                            )
                            
                          
                        })
                       
                    }
                )
                
                
                .fullScreenCover(isPresented: $isChatViewOpen) {
                    ChatView()
                }
                
               
            
            
        }else{
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 150, height: 150)
                .foregroundColor(.gray.opacity(0.2))
                .overlay(
                    VStack{
                        HStack{
                            Image(img1)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(20)
                                .opacity(0.2)
                                .padding(.horizontal, 5)
                            
                            Image(img2)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(20)
                                .opacity(0.2)
                                .padding(.horizontal, 5)
                        }
                        
                        HStack{
                            Image(img3)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(20)
                                .opacity(0.2)
                                .padding(.horizontal, 5)
                            
                            Image(img4)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(20)
                                .opacity(0.2)
                                .padding(.horizontal, 5)
                        }
                        
                      
                    }
                )
        }
        
            
    }
    
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView(isActive: true, img1: "1", img2: "2", img3: "3", img4: "4", level: []
, levelFeat: "Math")
    }
}




