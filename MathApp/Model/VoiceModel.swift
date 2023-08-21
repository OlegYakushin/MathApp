//
//  VoiceModel.swift
//  MathApp
//
//  Created by Oleg Yakushin on 8/1/23.
//

import Foundation
import AVFoundation
import Combine

class AudioRecorder: NSObject, ObservableObject, AVAudioRecorderDelegate {
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    
    var audioRecorder: AVAudioRecorder!
    
    var isRecording = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
            isRecording = true
        } catch {
            stopRecording()
        }
    }
    
    func stopRecording() {
        if audioRecorder != nil {
            audioRecorder.stop()
            audioRecorder = nil
            
            isRecording = false
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            stopRecording()
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}

class AudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    let objectWillChange = PassthroughSubject<AudioPlayer, Never>()
    
    var audioPlayer: AVAudioPlayer!
    
    var isPlaying = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    func startPlaying() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFilename)
            audioPlayer.delegate = self
            audioPlayer.play()
            
            isPlaying = true
        } catch {
            stopPlaying()
        }
    }
    
    func stopPlaying() {
        if audioPlayer != nil {
            audioPlayer.stop()
            audioPlayer = nil
            
            isPlaying = false
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            stopPlaying()
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}

