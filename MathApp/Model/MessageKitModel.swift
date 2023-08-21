//
//  MessageKitModel.swift
//  MathApp
//
//  Created by Oleg Yakushin on 8/5/23.
//
import Foundation
import SwiftUI
import MessageKit

struct MessageChat: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}
