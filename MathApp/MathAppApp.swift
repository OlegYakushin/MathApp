//
//  MathAppApp.swift
//  MathApp
//
//  Created by Oleg Yakushin on 7/30/23.
//

import SwiftUI
class UserData: ObservableObject {
    @AppStorage ("User Name") var user = "Robert"
}
@main
struct MathAppApp: App {
    @StateObject private var userData = UserData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userData)
                
        }
    }
}
