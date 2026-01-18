//
//  BreathSessionView.swift
//  BreathworkWatch
//
//  Main breath session view with visual and haptic feedback
//

import SwiftUI

struct BreathSessionView: View {
    let pattern: BreathPattern

    @StateObject private var sessionManager = BreathSessionManager()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 12) {
            // Pattern name
            Text(pattern.name)
                .font(.caption2)
                .foregroundColor(.secondary)

            // Visual breath animation
            BreathVisualView(
                phase: sessionManager.currentPhase,
                progress: sessionManager.progress
            )

            // Phase name
            Text(sessionManager.phaseName)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(phaseColor)

            // Repetition counter (if applicable)
            if let maxReps = pattern.repetitions {
                Text("\(sessionManager.currentRepetition + 1) / \(maxReps)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            // Control buttons
            HStack(spacing: 20) {
                if sessionManager.isActive {
                    Button(action: {
                        sessionManager.pause()
                    }) {
                        Image(systemName: "pause.fill")
                            .font(.title3)
                    }
                    .buttonStyle(.plain)
                } else if sessionManager.currentCycleIndex > 0 || sessionManager.progress > 0 {
                    Button(action: {
                        sessionManager.resume()
                    }) {
                        Image(systemName: "play.fill")
                            .font(.title3)
                    }
                    .buttonStyle(.plain)
                }

                Button(action: {
                    sessionManager.stop()
                    dismiss()
                }) {
                    Image(systemName: "stop.fill")
                        .font(.title3)
                }
                .buttonStyle(.plain)
                .tint(.red)
            }
            .padding(.top, 4)
        }
        .padding()
        .onAppear {
            sessionManager.start(pattern: pattern)
        }
        .onDisappear {
            sessionManager.stop()
        }
    }

    private var phaseColor: Color {
        switch sessionManager.currentPhase {
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
}

#Preview {
    BreathSessionView(pattern: .boxBreathing)
}
