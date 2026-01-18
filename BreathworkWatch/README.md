# Breathwork Watch App

A comprehensive Apple Watch breathwork application featuring meditation and kundalini breathing techniques with visual animations and haptic feedback.

## Features

- **Visual Breath Animation**: Dynamic, color-coded circular animations that expand and contract with your breath
- **Haptic Feedback**: Tactile cues for inhales, exhales, and holds to guide your practice
- **Multiple Categories**: Organized breath patterns for different purposes
- **Real-time Progress**: Visual progress rings showing your position in each breath cycle

## Breath Patterns

### Meditation Patterns

1. **Box Breathing (4-4-4-4)**: Equal 4-count breath for focus and calm
2. **4-7-8 Breathing**: Dr. Weil's relaxing breath technique
3. **Coherent Breathing (5-5)**: 5-second inhale and exhale for balance
4. **Deep Breathing (6-2-6-2)**: Slow, deep breaths for relaxation
5. **Resonant Breathing (6-6)**: 6-second cycles for optimal heart rate variability
6. **Triangle Breathing (4-4-4)**: Three-part breath for centering
7. **Relaxing Breath (4-2-6-2)**: Extended exhale for relaxation

### Kundalini Patterns

1. **Breath of Fire**: Rapid, rhythmic breathing to energize (60 cycles)
2. **Long Deep Breathing**: Full yogic breath for grounding
3. **Alternate Nostril**: Balanced breathing for clarity
4. **Sitali Breath**: Cooling breath for temperature regulation
5. **Suspending Breath**: Extended holds for meditation depth
6. **Segmented Breathing**: 4 inhales, 1 exhale for vitality
7. **Cannon Breath**: Powerful exhales for energy release
8. **Whistle Breath**: Quick inhale, slow exhale for focus

## Visual Feedback

The app uses color-coded animations to guide your practice:

- **Blue**: Inhale phase
- **Purple**: Hold phase (after inhale)
- **Green**: Exhale phase
- **Orange**: Hold phase (after exhale)
- **Gray**: Pause phase

The circular animation expands during inhales and contracts during exhales, with a progress ring showing your position in the current breath cycle.

## Haptic Feedback

Different haptic patterns guide each phase:

- **Inhale**: Rising haptic intensity
- **Exhale**: Falling haptic intensity
- **Hold**: Subtle notification
- **Pause**: Very subtle click

The intensity varies based on the breath pattern to provide appropriate guidance.

## Usage

1. Open the app on your Apple Watch
2. Select a category (Meditation, Kundalini, Calming, or Energizing)
3. Choose a breath pattern
4. The session starts automatically
5. Follow the visual animation and haptic feedback
6. Use pause/play to control the session
7. Tap stop to end the session

## Technical Details

### Architecture

- **SwiftUI**: Modern declarative UI framework
- **Combine**: Reactive state management
- **WatchKit**: Haptic feedback integration
- **MVVM Pattern**: Clean separation of concerns

### Key Components

- `BreathPattern.swift`: Data models for all breath patterns
- `BreathSessionManager.swift`: Session state and timing management
- `HapticService.swift`: Haptic feedback coordination
- `BreathVisualView.swift`: Animated visual representation
- `BreathSessionView.swift`: Main session interface
- `ContentView.swift`: Pattern selection interface

## Building

To build this app:

1. Open `BreathworkWatch.xcodeproj` in Xcode
2. Select an Apple Watch target (watchOS 9.0+)
3. Build and run on your device or simulator

## Requirements

- watchOS 9.0+
- Xcode 14.0+
- Apple Watch Series 4 or later (recommended for best haptic experience)

## License

This project is open source and available for personal and educational use.
