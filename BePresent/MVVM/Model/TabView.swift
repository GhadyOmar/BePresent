//
//  TabView.swift
//  BePresent
//
//  Created by Ghady Al Omar on 25/11/1447 AH.
//

import Foundation

enum Tab: Int, CaseIterable {
    case main = 0
    case memory = 1
    case profile = 2

    var icon: String {
        switch self {
        case .main:    return "house.fill"
        case .memory:  return "archivebox"
        case .profile: return "person.crop.circle.fill"
        }
    }

    var label: String {
        switch self {
        case .main:    return "Main"
        case .memory:  return "Memory"
        case .profile: return ""
        }
    }
}
