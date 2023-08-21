//
//  LevelModel.swift
//  MathApp
//
//  Created by Oleg Yakushin on 7/30/23.
//

import Foundation
 
struct Level: Codable, Identifiable {
    var id: String
    var levelname: String
    var level: String
    var levelFeatures: String
    var levelImg: String
    var levels: [SubLevel]
}

struct SubLevel: Codable, Identifiable {
    var id: String
    var order: Int
    var desc: String
    var levelFeatures: String
    var image: String
    var isCompleted: Bool
    var isFree: Bool
    var isActive: Bool
}


class LevelsViewModel: ObservableObject {
    @Published var levels: [Level] = []
    
    func loadLevelsFromJSON() {
        if let url = Bundle.main.url(forResource: "app", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.levels = try decoder.decode([Level].self, from: data)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}

struct Grouplessons: Codable, Identifiable, Hashable {
    var id: String
    var lesson: String
    var lessonDesc: String
    var isActive:  Bool
    var image: String
  
}
class LessonsViewModel: ObservableObject {
    @Published var lesson: [Grouplessons] = []
    
    func loadLevelsFromJSON() {
        if let url = Bundle.main.url(forResource: "groupLesson", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.lesson = try decoder.decode([Grouplessons].self, from: data)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}
