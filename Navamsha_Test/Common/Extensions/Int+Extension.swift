//
//  Int+Extension.swift
//  Navamsha_Test
//
//  Created by Nick Ivanov on 01.02.2024.
//

import Foundation

extension Int {
    func secondsToMinutesString() -> String {
        let hours = self / 3600
        let minutes = (self % 3600) / 60
        let seconds = (self % 3600) % 60
        
        if hours > .zero {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
}
