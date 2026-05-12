//
//  MainViewModel.swift
//  BePresent
//
//  Created by Ghady Al Omar on 25/11/1447 AH.
//

import Foundation
import Combine

@MainActor
class MainViewModel: ObservableObject {
    @Published var selectedTab: Tab = .main
    @Published var pulseAnimation: Bool = false

    func startPulse() {
        pulseAnimation = true
    }

    func selectTab(_ tab: Tab) {
        selectedTab = tab
    }
}
