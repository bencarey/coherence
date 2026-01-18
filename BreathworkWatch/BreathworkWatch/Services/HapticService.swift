//
//  HapticService.swift
//  BreathworkWatch
//
//  Manages haptic feedback for breath phases
//

import Foundation
import WatchKit

class HapticService {
    static let shared = HapticService()

    private init() {}

    func playHaptic(for phase: BreathPhase, intensity: Double) {
        let device = WKInterfaceDevice.current()

        switch phase {
        case .inhale:
            // Rising haptic pattern for inhale
            if intensity > 0.7 {
                device.play(.start)
            } else if intensity > 0.4 {
                device.play(.directionUp)
            } else {
                device.play(.click)
            }

        case .exhale:
            // Falling haptic pattern for exhale
            if intensity > 0.7 {
                device.play(.stop)
            } else if intensity > 0.4 {
                device.play(.directionDown)
            } else {
                device.play(.click)
            }

        case .hold, .holdExhale:
            // Subtle notification for holds
            if intensity > 0.3 {
                device.play(.notification)
            } else {
                device.play(.click)
            }

        case .pause:
            // Very subtle for pauses
            if intensity > 0.15 {
                device.play(.click)
            }
        }
    }

    func playStartHaptic() {
        WKInterfaceDevice.current().play(.start)
    }

    func playStopHaptic() {
        WKInterfaceDevice.current().play(.stop)
    }

    func playSuccessHaptic() {
        WKInterfaceDevice.current().play(.success)
    }
}
