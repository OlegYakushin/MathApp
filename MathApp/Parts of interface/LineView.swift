//
//  LineView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 8/2/23.
//

import SwiftUI

struct LineView: View {
    
    @State var level:String
   
        var body: some View {
            ZStack {
               RoundedRectangle(cornerRadius: 20)
                    .frame(width: 10,height: 80)
                    .foregroundColor(.black.opacity(0.5))
                
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("LightBlue"))
                    .overlay(Text(level).foregroundColor(.white).bold())
                
            }
           
            
        }
    }

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(level: "1")
    }
}


