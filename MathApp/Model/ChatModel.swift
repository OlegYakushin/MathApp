//
//  ChatModel.swift
//  MathApp
//
//  Created by Oleg Yakushin on 7/31/23.
//
import Foundation
import SwiftUI
import AVFoundation

struct Message: Identifiable, Codable {
    let id: UUID
    var sender: String
    var timestamp: Date
    var content: String
    var audioURL: URL?
    
    init(id: UUID, sender: String, timestamp: Date, content: String, audioURL: URL? = nil) {
        self.id = id
        self.sender = sender
        self.timestamp = timestamp
        self.content = content
        self.audioURL = audioURL
    }
}

struct Chat: Identifiable, Codable {
    let id: UUID
    var level: String
    var messages: [Message]
    
    init(id: UUID, level: String, messages: [Message]) {
        self.id = id
        self.level = level
        self.messages = messages
    }
}

extension Chat {
    static var sampleData: [Chat] =
    [
        Chat(
            id: UUID(),
            level: "1",
            messages: [
                Message(
                    id: UUID(),
                    sender: "",
                    timestamp: Date(),
                    content: "Hi John, how are you?"
                ),
                Message(
                    id: UUID(),
                    sender: "You",
                    timestamp: Date(),
                    content: "I'm good, thanks!"
                )
            ]
        ),
        Chat(
            id: UUID(),
            level: "2",
            messages: [
                Message(
                    id: UUID(),
                    sender: "",
                    timestamp: Date(),
                    content: "Hi!"
                ),
                Message(
                    id: UUID(),
                    sender: "You",
                    timestamp: Date(),
                    content: "",
                    audioURL: URL(string: "https://example.com/voice_message_1.mp3")
                )
            ]
        ),
        Chat(
            id: UUID(),
            level: "3",
            messages: [
                Message(
                    id: UUID(),
                    sender: "",
                    timestamp: Date(),
                    content: "Goodbye!"
                ),
                Message(
                    id: UUID(),
                    sender: "You",
                    timestamp: Date(),
                    content: "See you later!"
                )
            ]
        ),
        Chat(
            id: UUID(),
            level: "4",
            messages: [
                Message(
                    id: UUID(),
                    sender: "You",
                    timestamp: Date(),
                    content: "Have a nice day!"
                )
            ]
        )
    ]
}

