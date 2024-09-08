//
//  Schedule.swift
//  DarkThemeScheduler
//
//  Created by Pelok Balazs on 08/09/2024.
//

import Foundation

enum Schedule: Hashable {
    case custom(_ lightStart: TimeInterval, _ lightEnd: TimeInterval)
    case sunset(_ sunsetOffset: TimeInterval, _ sunriseOffset: TimeInterval)

    var name: String {
        switch self {
        case .custom:
            return "Custom"
        case .sunset:
            return "Sunset to sunrise"
        }
    }
}
