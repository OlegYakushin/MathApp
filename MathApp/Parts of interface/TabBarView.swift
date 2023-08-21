//
//  TabBarView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 8/2/23.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedView: String
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: UIScreen.main.bounds.width, height: 80)
            .foregroundColor(Color("TabBlue"))
            .overlay(
                HStack{
                    Button(action: {
                        selectedView = "home"
                    }, label: {
                        Image(systemName: "house.fill")
                            .font(.custom("Helvetica", size: 30))
                            .foregroundColor(selectedView == "home" ? .blue : .gray)
                      
                    }
                           )
                    Spacer()
                    Button(action: {
                        selectedView = "share"
                       
                    }, label: {
                        Image(systemName: "square.and.arrow.up.fill")
                    
                            .font(.custom("Helvetica", size: 30))
                            .foregroundColor(selectedView == "share" ? .blue : .gray)
                      
                    }
                           )
                    Spacer()
                    Button(action: {
                        selectedView = "profile"
                       
                    }, label: {
                        Image(systemName: "person.fill")
                        
                            .font(.custom("Helvetica", size: 30))
                            .foregroundColor(selectedView == "profile" ? .blue : .gray)
                      
                    }
                           )
                }
                    .padding(.horizontal, 40)
            )
            }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedView: .constant("home"))
    }
}
