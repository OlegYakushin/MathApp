//
//  TopicView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 8/1/23.
//

import SwiftUI

struct TopicView: View {
    @State  var level: String
    @State  var levelDecs: String
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 340, height: 150)
            .foregroundColor(Color("LightBlue"))
            .overlay(
                HStack{
                    VStack(alignment: .leading){
                        Text(level)
                            .foregroundColor(.white)
                            .bold()
                            .padding(.vertical)
                       
                        Text(levelDecs)
                            .foregroundColor(.white)
                            
                        Spacer()
                        
                    }
                    .padding()
                    Spacer()
                }
        )
    }
}

struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        TopicView(level: "First level", levelDecs: "Basic Matematics")
    }
}
