//
//  ContentView.swift
//  BreathworkWatch
//
//  Main view for selecting breath patterns
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCategory: BreathCategory = .meditation

    var body: some View {
        NavigationView {
            VStack {
                // Category picker
                Picker("Category", selection: $selectedCategory) {
                    ForEach(BreathCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 4)
                .padding(.bottom, 4)

                // Pattern list
                List {
                    ForEach(filteredPatterns) { pattern in
                        NavigationLink(destination: BreathSessionView(pattern: pattern)) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(pattern.name)
                                    .font(.headline)

                                Text(pattern.description)
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                            }
                            .padding(.vertical, 2)
                        }
                    }
                }
            }
            .navigationTitle("Breathwork")
        }
    }

    private var filteredPatterns: [BreathPattern] {
        BreathPattern.allPatterns.filter { $0.category == selectedCategory }
    }
}

#Preview {
    ContentView()
}
