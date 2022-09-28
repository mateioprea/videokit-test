//
//  VideoKit.swift
//  react-native-videokit2
//
//  Created by Matei Oprea on 28.09.2022.
//

import Foundation
import AVFoundation
import AVKit
import UIKit
import React



@objc(VideoKit)
public final class VideoKit: UIView {
  
  var videoNode: ASVideoNode?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.videoNode = ASVideoNode()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    videoNode?.frame = self.layer.bounds
  }
  
  
  deinit {
    self.videoNode = nil
  }
  
  @objc(setSource:)
  func setSource(source: String) {
      let asset = AVAsset(url: URL(string: source)!)

    DispatchQueue.main.async {
      self.videoNode?.asset = asset
    }
    self.videoNode?.gravity = AVLayerVideoGravity.resizeAspect.rawValue
    self.videoNode?.shouldAutorepeat = true
    self.videoNode?.shouldAutoplay = true
    self.videoNode?.muted = false
    self.videoNode?.view.isUserInteractionEnabled = false
    self.addSubview(self.videoNode!.view)
  }
    
    @objc(setPaused:)
    func setPaused(paused: Bool) {
        if (paused) {
            self.videoNode?.pause()
        } else {
            self.videoNode?.play();
        }
    }
  
  func play() {
    DispatchQueue.main.async {
      self.videoNode?.play();
    }
  }
  
  func pause() {
    DispatchQueue.main.async {
      self.videoNode?.pause()
    }
  }
  
  func replay() {
    self.videoNode?.player?.seek(to: CMTime.zero)
    self.videoNode?.play()
  }
  
  func seekToBeginning() {
    DispatchQueue.main.async {
      self.videoNode?.player?.seek(to: CMTime.zero)
    }
  }
  
  func isPlaying() -> Bool {
    return self.videoNode?.isPlaying() ?? false
  }
}
