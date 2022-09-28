//
//  VideoKitManager.swift
//  react-native-videokit2
//
//  Created by Matei Oprea on 28.09.2022.
//

import Foundation
import React
import AsyncDisplayKit



@objc(VideoKitManager)
final class VideoKitManager: RCTViewManager {
  
  override var methodQueue: DispatchQueue! {
    return DispatchQueue.main
  }

  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  override final func view() -> UIView! {
    return VideoKit()
  }
  
  private func getView(withTag tag: NSNumber) -> VideoKit {
    return bridge.uiManager.view(forReactTag: tag) as! VideoKit
  }
  
  @objc
  final func play(_ node: NSNumber) {
    let component = getView(withTag: node)
    component.play()
  }
  
  @objc
  final func pause(_ node: NSNumber) {
    let component = getView(withTag: node)
    component.pause()
  }
  
  @objc
  final func replay(_ node: NSNumber) {
    let component = getView(withTag: node)
    component.replay()
  }
  
  @objc
  final func seekToBeginning(_ node: NSNumber) {
    let component = getView(withTag: node)
    component.seekToBeginning()
  }
  
  @objc
  final func isPlaying(_ node: NSNumber) {
    let component = getView(withTag: node)
    let playing = component.isPlaying()
    print("Video p", playing);
    //return component.isPlaying()
  }
  
  
}
