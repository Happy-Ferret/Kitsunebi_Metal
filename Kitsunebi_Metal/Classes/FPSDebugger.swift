//
//  FPSDebugger.swift
//  Kitsunebi_Metal
//
//  Created by Tomoya Hirano on 2018/07/23.
//

import Foundation

class FPSDebugger {
  static let shared = FPSDebugger()
  
  private var prev: TimeInterval = 0.0
  
  internal func update(_ link: CADisplayLink) {
    print("\(Int(1.0 / (link.timestamp - prev)))fps")
    prev = link.timestamp
  }
}
