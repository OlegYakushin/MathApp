//
//  ChatStore.swift
//  MathApp
//
//  Created by Oleg Yakushin on 8/2/23.
//

import SwiftUI


@MainActor
class ChatStore: ObservableObject {
    @Published var chats: [Chat] = []
    
    private static func fileURL() throws -> URL {
            try FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: false)
            .appendingPathComponent("chats.data")
        }
    
    func load() async throws {
           let task = Task<[Chat], Error> {
               let fileURL = try Self.fileURL()
               guard let data = try? Data(contentsOf: fileURL) else {
                   return []
               }
               let chatAll = try JSONDecoder().decode([Chat].self, from: data)
               
               return chatAll
           }
           let chats = try await task.value
           self.chats = chats
       }
       
        func save(chats: [Chat]) async throws {
            let task = Task {
                    let data = try JSONEncoder().encode(chats)
                                let outfile = try Self.fileURL()
                                try data.write(to: outfile)
                }
            _ = try await task.value
    }
    
}
