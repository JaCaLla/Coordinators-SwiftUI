//
//  EViewModel.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 4/10/21.
//

import Foundation
import Combine

protocol EViewModelProtocol: ObservableObject {
    var runCountStr: String { get }
}

final class EViewModel: EViewModelProtocol {
    private var runCount = 0
    @Published var runCountStr: String = "?"
    @Published var showingDetail = false
    
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

