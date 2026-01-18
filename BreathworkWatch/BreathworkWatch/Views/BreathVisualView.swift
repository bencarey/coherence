//
//  BreathVisualView.swift
//  BreathworkWatch
//
//  Animated visual representation of breathing
//

import SwiftUI

struct BreathVisualView: View {
    let phase: BreathPhase
    let progress: Double

    @State private var animationScale: CGFloat = 1.0

    var body: some View {
        ZStack {
            // Background gradient
            Circle()
                .fill(
                    RadialGradient(
                        gradient: phaseGradient,
                        center: .center,
                        startRadius: 5,
                        endRadius: 100
                    )
                )
                .frame(width: breathCircleSize, height: breathCircleSize)
                .scaleEffect(animationScale)
                .animation(.easeInOut(duration: 0.5), value: animationScale)

            // Inner pulsing circle
            Circle()
                .stroke(lineWidth: 3)
                .fill(phaseColor.opacity(0.6))
                .frame(width: breathCircleSize * 0.7, height: breathCircleSize * 0.7)
                .scaleEffect(pulseScale)

            // Progress ring
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    phaseColor,
                    style: StrokeStyle(lineWidth: 6, lineCap: .round)
                )
                .frame(width: breathCircleSize + 10, height: breathCircleSize + 10)
                .rotationEffect(.degrees(-90))
                .animation(.linear(duration: 0.1), value: progress)
        }
        .onChange(of: phase) { _, _ in
            updateAnimation()
        }
        .onAppear {
            updateAnimation()
        }
    }

    private var breathCircleSize: CGFloat {
        let baseSize: CGFloat = 100
        switch phase {
        case .inhale:
            return baseSize + (CGFloat(progress) * 30)
        case .exhale:
            return baseSize + 30 - (CGFloat(progress) * 30)
        case .hold, .holdExhale:
            return baseSize + 15
        case .pause:
            return baseSize
        }
    }

    private var pulseScale: CGFloat {
        switch phase {
        case .inhale:
            return 1.0 + (progress * 0.3)
        case .exhale:
            return 1.3 - (progress * 0.3)
        case .hold, .holdExhale:
            return 1.15 + sin(progress * .pi * 4) * 0.05
        case .pause:
            return 1.0
        }
    }

    private var phaseColor: Color {
        switch phase {
        case .inhale:
            return .blue
        case .hold:
            return .purple
        case .exhale:
            return .green
        case .holdExhale:
            return .orange
        case .pause:
            return .gray
        }
    }

    private var phaseGradient: Gradient {
        switch phase {
        case .inhale:
            return Gradient(colors: [.blue.opacity(0.8), .cyan.opacity(0.3)])
        case .hold:
            return Gradient(colors: [.purple.opacity(0.8), .pink.opacity(0.3)])
        case .exhale:
            return Gradient(colors: [.green.opacity(0.8), .mint.opacity(0.3)])
        case .holdExhale:
            return Gradient(colors: [.orange.opacity(0.8), .yellow.opacity(0.3)])
        case .pause:
            return Gradient(colors: [.gray.opacity(0.6), .gray.opacity(0.2)])
        }
    }

    private func updateAnimation() {
        withAnimation(.easeInOut(duration: 0.3)) {
            animationScale = phase == .inhale || phase == .hold ? 1.1 : 0.9
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        BreathVisualView(phase: .inhale, progress: 0.5)
        BreathVisualView(phase: .hold, progress: 0.7)
        BreathVisualView(phase: .exhale, progress: 0.3)
    }
}
