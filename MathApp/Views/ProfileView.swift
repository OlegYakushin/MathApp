//
//  ProfileView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 7/30/23.
//
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var userData: UserData

    @State private var draftUser = ""
    @State private var languages = ["Turkish", "English", "German", "French", "Spanish"]
    @AppStorage("language") private var language = "English"
    @State private var draftLanguage = "English"
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            VStack {
                Text("Profile")
                
                Image("ProfileImage")
                
                HStack {
                    Text("Profile Name")
                        .bold()
                    Spacer()
                }
                .padding()
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color("LightBlue").opacity(0.5))
                    .frame(width: 360, height: 60)
                    .overlay(
                        TextField("\(userData.user)", text: $draftUser)
                        
                            .padding()
                    )
                    .padding(.horizontal)
                
                HStack {
                    Spacer()
                    Button(action: {
                        saveUserName()
                    }) {
                        ButtonView(text: "Save")
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    Text("Language")
                        .bold()
                    Spacer()
                }
                .padding()
                
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color("LightBlue").opacity(0.5))
                    .frame(width: 360, height: 60)
                    .overlay(
                        HStack {
                            Image(draftLanguage)
                                .resizable()
                                .frame(width: 40, height: 30)
                            
                            Picker("Language", selection: $draftLanguage) { // Use draftLanguage for Picker
                                ForEach(languages, id: \.self) { lang in
                                    Text(lang).tag(lang)
                                }
                            }
                            Spacer()
                            
                        }
                        .padding(.horizontal)
                    )
                
                HStack {
                    Spacer()
                    Button(action: {
                        saveLanguage() // Call the function to save the language
                    }) {
                        ButtonView(text: "Save")
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
    }
    
    private func saveUserName() {
       
        userData.user = draftUser
    }
    
    private func saveLanguage() {
       
        language = draftLanguage
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
