//
//  MessageView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 7/31/23.
//

import SwiftUI
import AVFoundation

struct MessageView: View {
    let message: Message
    let isYou: Bool
    
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        HStack {
            
            if let audioURL = message.audioURL {
                
                
                if isYou {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 2) {
                        Button(action: {
                            playAudio(audioURL: audioURL)
                        }) {
                            Image(systemName: "play.circle")
                                .foregroundColor(.green)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(5)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                } else {
                    VStack(alignment: .leading, spacing: 2) {
                        Button(action: {
                            playAudio(audioURL: audioURL)
                        }) {
                            Image(systemName: "play.circle")
                                .foregroundColor(.green)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    Spacer()
                }
               
            }else{
                if isYou {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 2) {
                        Text(message.content)
                    }
                    .padding(5)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                } else {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(message.content)
                    }
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    Spacer()
                }
                
            }
        
                
            
        }
        .padding(.horizontal)
    }
    
    private func playAudio(audioURL: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.play()
        } catch {
            // Handle errors while playing audio
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message(id: UUID(), sender: "You", timestamp: Date(), content: "Hi!"), isYou: false)
    }
}
