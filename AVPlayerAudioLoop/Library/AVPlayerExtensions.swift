//
//  AVPlayerExtensions.swift
//  AVPlayerFade
//
//  Created by Evandro Harrison Hoffmann on 21/05/2020.
//  Copyright © 2020 It's Day Off. All rights reserved.
//

import AVFoundation

extension AVPlayer {
    
    /// Creates audio session
    static func startAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [])
        }catch{
            print("Something went wrong creating audio session... \(error)")
            return
        }
    }
    
    /// Loops audio for given item
    /// - Parameter item: player item to loop
    func loop(_ item: AVPlayerItem) {
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: item, queue: .main) { _ in
            // basically what we are doing here is to listen to the event of finished playing and going back to start and playing again
            self.seek(to: CMTime.zero)
            self.play()
            
            print("playback reached the end, going back to start.")
        }
    }
}
