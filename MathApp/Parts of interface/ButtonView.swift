//
//  ButtonView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 7/30/23.
//

import SwiftUI

struct ButtonView: View {
    @State var text: String
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color("LightBlue").opacity(0.5))
            .frame(width: 100, height: 50)
            .overlay(
                Text(text)
                    .foregroundColor(.black)
            )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Save")
    }
}
