//
//  AViewModel.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 26/9/21.
//

import Foundation
import Combine

protocol AViewModelProtocol: ObservableObject {
    var runCountStr: String { get }
}

final class AViewModel: AViewModelProtocol {
    private var runCount = 0
    @Published var runCountStr: String = "?"
    
    private var timer: Timer?
    
    init() {
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() {
        runCount += 1
        runCountStr = "\(runCount)"
    }
    
    deinit {
        timer?.invalidate()
    }
}
