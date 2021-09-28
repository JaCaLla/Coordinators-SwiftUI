//
//  CViewModel.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 1/10/21.
//

import Foundation

protocol CViewModelProtocol: ObservableObject {
    var runCountStr: String { get }
}

final class CViewModel: CViewModelProtocol {
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
