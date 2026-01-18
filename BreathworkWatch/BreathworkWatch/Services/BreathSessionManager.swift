//
//  BreathSessionManager.swift
//  BreathworkWatch
//
//  Manages breath session timing and state
//

import Foundation
import Combine

class BreathSessionManager: ObservableObject {
    @Published var currentPhase: BreathPhase = .inhale
    @Published var progress: Double = 0.0
    @Published var isActive: Bool = false
    @Published var currentCycleIndex: Int = 0
    @Published var currentRepetition: Int = 0

    private var pattern: BreathPattern?
    private var timer: Timer?
    private var phaseStartTime: Date?
    private var currentCycleDuration: TimeInterval = 0

    func start(pattern: BreathPattern) {
        self.pattern = pattern
        self.isActive = true
        self.currentCycleIndex = 0
        self.currentRepetition = 0
        self.progress = 0.0

        HapticService.shared.playStartHaptic()
        startNextCycle()
    }

    func stop() {
        timer?.invalidate()
        timer = nil
        isActive = false
        HapticService.shared.playStopHaptic()
    }

    func pause() {
        timer?.invalidate()
        timer = nil
        isActive = false
    }

    func resume() {
        guard pattern != nil else { return }
        isActive = true
        startTimer()
    }

    private func startNextCycle() {
        guard let pattern = pattern else { return }

        let cycle = pattern.cycles[currentCycleIndex]
        currentPhase = cycle.phase
        currentCycleDuration = cycle.duration
        phaseStartTime = Date()
        progress = 0.0

        // Play haptic for new phase
        HapticService.shared.playHaptic(for: cycle.phase, intensity: cycle.hapticIntensity)

        startTimer()
    }

    private func startTimer() {
        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] _ in
            self?.updateProgress()
        }
    }

    private func updateProgress() {
        guard let pattern = pattern,
              let startTime = phaseStartTime else { return }

        let elapsed = Date().timeIntervalSince(startTime)
        progress = min(elapsed / currentCycleDuration, 1.0)

        if elapsed >= currentCycleDuration {
            advanceToNextCycle()
        }
    }

    private func advanceToNextCycle() {
        guard let pattern = pattern else { return }

        currentCycleIndex += 1

        if currentCycleIndex >= pattern.cycles.count {
            // Completed one full cycle
            currentCycleIndex = 0
            currentRepetition += 1

            // Check if we should continue
            if let maxReps = pattern.repetitions, currentRepetition >= maxReps {
                stop()
                HapticService.shared.playSuccessHaptic()
                return
            }
        }

        startNextCycle()
    }

    var phaseName: String {
        switch currentPhase {
        case .inhale:
            return "Inhale"
        case .hold:
            return "Hold"
        case .exhale:
            return "Exhale"
        case .holdExhale:
            return "Hold"
        case .pause:
            return "Pause"
        }
    }

    var phaseColor: String {
        switch currentPhase {
        case .inhale:
            return "blue"
        case .hold:
            return "purple"
        case .exhale:
            return "green"
        case .holdExhale:
            return "orange"
        case .pause:
            return "gray"
        }
    }
}
