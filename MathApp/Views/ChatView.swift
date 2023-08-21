//
//  ChatView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 7/30/23.
//

import SwiftUI
import AVFoundation
import AVKit

struct ChatView: View {
    @State private var message = ""
    @Environment(\.dismiss) var dismiss
    @State private var chat = Chat.sampleData[1]
    @State private var isRecording = false
    @State var session : AVAudioSession!
    @State private var audioRecorder: AVAudioRecorder?
    @State private var isMicrophoneAuthorized = false
    @State var alert = false
    @State private var isAudioSent = false
    var body: some View {
        ZStack{
            
            VStack{
                ZStack{
                    
                    Image("LevelImg")
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: UIScreen.main.bounds.width,height: 150)
                    
                    Button(action: {
                       dismiss()
                    }, label: {
                        HStack{
                            Image(systemName: "chevron.backward")
                                .bold()
                                .foregroundColor(.black)
                            Text("Back")
                                .bold()
                                .foregroundColor(.black)
                        }
                    }
                        
                           )
                    .offset(x: -150, y: 0)
                    Text("Level 1")
                        .font(Font.system(size: 20))
                        .bold()
                        .offset(x: -150, y: 50)
                    
                    
                }
                Spacer()
                
                
                ScrollView(showsIndicators: false) {
                                    LazyVStack(alignment: .leading) {
                                        ForEach(chat.messages) { message in
                                            MessageView(message: message, isYou: message.sender == "You")
                                        }
                                    }
                                }
                    
                
                
              
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("LightBlue").opacity(0.5))
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                        .overlay(
                            HStack{
                                
                                Button(action: {
                                  
                                                               if isRecording {
                                                                   stopRecording()
                                                                   print("stop recording")
                                                               } else {
                                                                   startRecording()
                                                                   print("start recording")
                                                                   
                                                               }
                                                           }) {
                                                               Image(systemName: isRecording ? "stop.circle" : "mic")
                                                                   .font(Font.system(size: 20))
                                                           }
                                .buttonStyle(PlainButtonStyle())
                                TextField("Message", text: $message)
                                    .textFieldStyle(PlainTextFieldStyle())
                                Button(action: {
                                    sendMessage()
                                }) {
                                    Image(systemName: "paperplane")
                                        .font(Font.system(size: 20))
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            
                            
                                .padding()
                        )
                
            }
           
            
        }
        .ignoresSafeArea()
        .alert(isPresented: $alert) {
                   Alert(
                       title: Text("Microphone Access"),
                       message: Text("Please allow microphone access in Settings to record audio."),
                       primaryButton: .default(Text("Open Settings"), action: openSettings),
                       secondaryButton: .cancel()
                   )
               }
        .onAppear{
            checkMicrophoneAuthorization()
        }
        
    }
    private func openSettings() {
           guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
               return
           }
           UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
       }
    private func checkMicrophoneAuthorization() {
           AVAudioSession.sharedInstance().requestRecordPermission { granted in
               DispatchQueue.main.async {
                   self.isMicrophoneAuthorized = granted
               }
           }
       }

    
    private func sendMessage() {
      
        if !message.isEmpty {
           
            
            let newMessage = Message(
                id: UUID(),
                sender: "You",
                timestamp: Date(),
                content: message
            )
            chat.messages.append(newMessage)
        
            message = ""
        }
    }
    private func startRecording() {
         let audioSession = AVAudioSession.sharedInstance()
         do {
             try audioSession.setCategory(.record, mode: .default)
             try audioSession.setActive(true)
             
             let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
             let audioFilename = documentsPath.appendingPathComponent("recording.m4a")
             
             let settings = [
                 AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                 AVSampleRateKey: 44100.0,
                 AVNumberOfChannelsKey: 1,
                 AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
             ] as [String : Any]
             
             audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
             audioRecorder?.record()
             isRecording = true
         } catch {
            
             print("Error starting recording: \(error.localizedDescription)")
         }
     }
     
    private func stopRecording() {
        guard let recorder = audioRecorder, recorder.isRecording else {
            return
        }

        recorder.stop()
        audioRecorder = nil
        isRecording = false

        let newMessage = Message(
            id: UUID(),
            sender: "You",
            timestamp: Date(),
            content: "",
            audioURL: recorder.url
        )
        chat.messages.append(newMessage)
    }


 }


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
