//
//  ContentView.swift
//  DarkThemeScheduler
//
//  Created by Pelok Balazs on 07/09/2024.
//

import SwiftUI

enum Theme: String {
    case light = "Light"
    case dark = "Dark"
    case auto = "Automatic"
}

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

struct ContentView: View {
    @State private var selectedTheme: Theme = .auto
    
    private var customScheduleSetup: Schedule = .custom(6 * 3600, 20 * 3600)
    private var sunsetScheduleSetup: Schedule = .sunset(0.0, 0.0)
    
    @State private var selectedAutoSchedule: Schedule
    
    init() {
        _selectedAutoSchedule = State(initialValue: customScheduleSetup)
    }

    func getThemeButton(iconStr: String, theme: Theme) -> some View {
        Button(action: {
            selectedTheme = theme
        }) {
            Image(systemName: iconStr)
                .frame(width: 50, height: 50)
                .background(selectedTheme == theme ? Color.blue.opacity(0.2) : Color.clear)
                .cornerRadius(10)
        }
    }

    var body: some View {
        VStack {
            HStack {
                getThemeButton(iconStr: "sun.max.fill", theme: .light)
                getThemeButton(iconStr: "moon.stars.fill", theme: .dark)
                getThemeButton(iconStr: "circle.grid.cross.fill", theme: .auto)
            }
            .buttonStyle(PlainButtonStyle())
            .padding()

            if selectedTheme == .auto {
                Picker("Auto Options", selection: $selectedAutoSchedule) {
                    Text(customScheduleSetup.name).tag(customScheduleSetup.name)
                    Text(sunsetScheduleSetup.name).tag(sunsetScheduleSetup.name)
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
            }
        }
        .frame(width: 320, height: 240)
    }
}

#Preview {
    ContentView()
}
