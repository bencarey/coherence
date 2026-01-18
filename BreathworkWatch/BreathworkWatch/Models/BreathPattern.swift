//
//  BreathPattern.swift
//  BreathworkWatch
//
//  Breath pattern models for meditation and kundalini techniques
//

import Foundation

enum BreathPhase {
    case inhale
    case hold
    case exhale
    case holdExhale
    case pause
}

struct BreathCycle {
    let phase: BreathPhase
    let duration: TimeInterval
    let hapticIntensity: Double // 0.0 to 1.0
}

struct BreathPattern: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let category: BreathCategory
    let cycles: [BreathCycle]
    let repetitions: Int? // nil means continuous

    var totalDuration: TimeInterval {
        let cycleTime = cycles.reduce(0) { $0 + $1.duration }
        return cycleTime * Double(repetitions ?? 1)
    }
}

enum BreathCategory: String, CaseIterable {
    case meditation = "Meditation"
    case kundalini = "Kundalini"
    case calming = "Calming"
    case energizing = "Energizing"
}

// MARK: - Meditation Patterns
extension BreathPattern {

    // Box Breathing (4-4-4-4)
    static let boxBreathing = BreathPattern(
        name: "Box Breathing",
        description: "Equal 4-count breath for focus and calm",
        category: .meditation,
        cycles: [
            BreathCycle(phase: .inhale, duration: 4.0, hapticIntensity: 0.6),
            BreathCycle(phase: .hold, duration: 4.0, hapticIntensity: 0.3),
            BreathCycle(phase: .exhale, duration: 4.0, hapticIntensity: 0.6),
            BreathCycle(phase: .holdExhale, duration: 4.0, hapticIntensity: 0.3)
        ],
        repetitions: nil
    )

    // 4-7-8 Breathing (Relaxing Breath)
    static let fourSevenEight = BreathPattern(
        name: "4-7-8 Breathing",
        description: "Dr. Weil's relaxing breath technique",
        category: .calming,
        cycles: [
            BreathCycle(phase: .inhale, duration: 4.0, hapticIntensity: 0.5),
            BreathCycle(phase: .hold, duration: 7.0, hapticIntensity: 0.2),
            BreathCycle(phase: .exhale, duration: 8.0, hapticIntensity: 0.7)
        ],
        repetitions: nil
    )

    // Coherent Breathing (5-5)
    static let coherentBreathing = BreathPattern(
        name: "Coherent Breathing",
        description: "5-second inhale and exhale for balance",
        category: .meditation,
        cycles: [
            BreathCycle(phase: .inhale, duration: 5.0, hapticIntensity: 0.5),
            BreathCycle(phase: .exhale, duration: 5.0, hapticIntensity: 0.5)
        ],
        repetitions: nil
    )

    // Deep Breathing (6-2-6-2)
    static let deepBreathing = BreathPattern(
        name: "Deep Breathing",
        description: "Slow, deep breaths for relaxation",
        category: .calming,
        cycles: [
            BreathCycle(phase: .inhale, duration: 6.0, hapticIntensity: 0.6),
            BreathCycle(phase: .hold, duration: 2.0, hapticIntensity: 0.2),
            BreathCycle(phase: .exhale, duration: 6.0, hapticIntensity: 0.6),
            BreathCycle(phase: .pause, duration: 2.0, hapticIntensity: 0.1)
        ],
        repetitions: nil
    )

    // Resonant Breathing (6-6)
    static let resonantBreathing = BreathPattern(
        name: "Resonant Breathing",
        description: "6-second cycles for optimal heart rate variability",
        category: .meditation,
        cycles: [
            BreathCycle(phase: .inhale, duration: 6.0, hapticIntensity: 0.5),
            BreathCycle(phase: .exhale, duration: 6.0, hapticIntensity: 0.5)
        ],
        repetitions: nil
    )

    // Triangle Breathing (4-4-4)
    static let triangleBreathing = BreathPattern(
        name: "Triangle Breathing",
        description: "Three-part breath for centering",
        category: .meditation,
        cycles: [
            BreathCycle(phase: .inhale, duration: 4.0, hapticIntensity: 0.6),
            BreathCycle(phase: .hold, duration: 4.0, hapticIntensity: 0.3),
            BreathCycle(phase: .exhale, duration: 4.0, hapticIntensity: 0.6)
        ],
        repetitions: nil
    )

    // Relaxing Breath (4-2-6-2)
    static let relaxingBreath = BreathPattern(
        name: "Relaxing Breath",
        description: "Extended exhale for relaxation",
        category: .calming,
        cycles: [
            BreathCycle(phase: .inhale, duration: 4.0, hapticIntensity: 0.5),
            BreathCycle(phase: .hold, duration: 2.0, hapticIntensity: 0.2),
            BreathCycle(phase: .exhale, duration: 6.0, hapticIntensity: 0.7),
            BreathCycle(phase: .pause, duration: 2.0, hapticIntensity: 0.1)
        ],
        repetitions: nil
    )
}

// MARK: - Kundalini Patterns
extension BreathPattern {

    // Breath of Fire
    static let breathOfFire = BreathPattern(
        name: "Breath of Fire",
        description: "Rapid, rhythmic breathing to energize",
        category: .kundalini,
        cycles: [
            BreathCycle(phase: .inhale, duration: 0.5, hapticIntensity: 0.4),
            BreathCycle(phase: .exhale, duration: 0.5, hapticIntensity: 0.6)
        ],
        repetitions: 60 // 1 minute
    )

    // Long Deep Breathing
    static let longDeepBreathing = BreathPattern(
        name: "Long Deep Breathing",
        description: "Full yogic breath for grounding",
        category: .kundalini,
        cycles: [
            BreathCycle(phase: .inhale, duration: 8.0, hapticIntensity: 0.5),
            BreathCycle(phase: .exhale, duration: 8.0, hapticIntensity: 0.5)
        ],
        repetitions: nil
    )

    // Alternate Nostril Breathing (Simplified Watch Version)
    static let alternateNostril = BreathPattern(
        name: "Alternate Nostril",
        description: "Balanced breathing for clarity",
        category: .kundalini,
        cycles: [
            BreathCycle(phase: .inhale, duration: 4.0, hapticIntensity: 0.4),
            BreathCycle(phase: .hold, duration: 4.0, hapticIntensity: 0.2),
            BreathCycle(phase: .exhale, duration: 4.0, hapticIntensity: 0.6),
            BreathCycle(phase: .hold, duration: 4.0, hapticIntensity: 0.2)
        ],
        repetitions: nil
    )

    // Sitali Breath (Cooling)
    static let sitaliBreath = BreathPattern(
        name: "Sitali Breath",
        description: "Cooling breath for temperature regulation",
        category: .kundalini,
        cycles: [
            BreathCycle(phase: .inhale, duration: 4.0, hapticIntensity: 0.3),
            BreathCycle(phase: .hold, duration: 2.0, hapticIntensity: 0.2),
            BreathCycle(phase: .exhale, duration: 6.0, hapticIntensity: 0.5)
        ],
        repetitions: nil
    )

    // Suspending Breath
    static let suspendingBreath = BreathPattern(
        name: "Suspending Breath",
        description: "Extended holds for meditation depth",
        category: .kundalini,
        cycles: [
            BreathCycle(phase: .inhale, duration: 5.0, hapticIntensity: 0.5),
            BreathCycle(phase: .hold, duration: 10.0, hapticIntensity: 0.2),
            BreathCycle(phase: .exhale, duration: 5.0, hapticIntensity: 0.5),
            BreathCycle(phase: .holdExhale, duration: 10.0, hapticIntensity: 0.1)
        ],
        repetitions: nil
    )

    // Segmented Breathing (4 parts in, 1 out)
    static let segmentedBreathing = BreathPattern(
        name: "Segmented Breathing",
        description: "4 inhales, 1 exhale for vitality",
        category: .kundalini,
        cycles: [
            BreathCycle(phase: .inhale, duration: 0.75, hapticIntensity: 0.4),
            BreathCycle(phase: .inhale, duration: 0.75, hapticIntensity: 0.4),
            BreathCycle(phase: .inhale, duration: 0.75, hapticIntensity: 0.4),
            BreathCycle(phase: .inhale, duration: 0.75, hapticIntensity: 0.4),
            BreathCycle(phase: .exhale, duration: 3.0, hapticIntensity: 0.7)
        ],
        repetitions: nil
    )

    // Cannon Breath
    static let cannonBreath = BreathPattern(
        name: "Cannon Breath",
        description: "Powerful exhales for energy release",
        category: .kundalini,
        cycles: [
            BreathCycle(phase: .inhale, duration: 3.0, hapticIntensity: 0.5),
            BreathCycle(phase: .exhale, duration: 1.0, hapticIntensity: 0.9),
            BreathCycle(phase: .pause, duration: 1.0, hapticIntensity: 0.1)
        ],
        repetitions: nil
    )

    // Whistle Breath
    static let whistleBreath = BreathPattern(
        name: "Whistle Breath",
        description: "Quick inhale, slow exhale for focus",
        category: .kundalini,
        cycles: [
            BreathCycle(phase: .inhale, duration: 1.0, hapticIntensity: 0.6),
            BreathCycle(phase: .exhale, duration: 5.0, hapticIntensity: 0.5)
        ],
        repetitions: nil
    )
}

// MARK: - Pattern Collections
extension BreathPattern {
    static let allPatterns: [BreathPattern] = [
        // Meditation
        .boxBreathing,
        .fourSevenEight,
        .coherentBreathing,
        .deepBreathing,
        .resonantBreathing,
        .triangleBreathing,
        .relaxingBreath,

        // Kundalini
        .breathOfFire,
        .longDeepBreathing,
        .alternateNostril,
        .sitaliBreath,
        .suspendingBreath,
        .segmentedBreathing,
        .cannonBreath,
        .whistleBreath
    ]

    static func patterns(for category: BreathCategory) -> [BreathPattern] {
        allPatterns.filter { $0.category == category }
    }
}
