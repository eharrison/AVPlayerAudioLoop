//
//  ViewController.swift
//  AVPlayerAudioLoop
//
//  Created by Evandro Harrison Hoffmann on 30/06/2020.
//  Copyright © 2020 It's Day Off. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPlayer()
    }
    
    private lazy var player: AVPlayer = .init()
    private func setupPlayer() {
        AVPlayer.startAudioSession()
        
        // Setup player
        let url = URL.bundleURL(for: "water", fileExtension: "mp3")!
        let item = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: item)
        player.play()
        player.loop(item)
        
        playButton.isSelected = true
        
        addTimeObserver()
    }
    
    // MARK: - Observers
    
    private var timeObserver: AnyObject?
    private func addTimeObserver() {
        let timeInterval: CMTime = CMTimeMakeWithSeconds(1.0, preferredTimescale: 10)
        timeObserver = player.addPeriodicTimeObserver(forInterval: timeInterval, queue: DispatchQueue.main) { [weak self] (elapsedTime: CMTime) -> Void in
            guard let self = self else { return }
            guard let currentItem = self.player.currentItem else { return }
            self.progressBar.progress = Float(elapsedTime.seconds/currentItem.duration.seconds)
        } as AnyObject?
    }

    // MARK: - Actions
    
    @IBAction func togglePlay(_ sender: Any) {
        playButton.isSelected = !playButton.isSelected
        
        if playButton.isSelected {
            player.play()
        } else {
            player.pause()
        }
    }
}
