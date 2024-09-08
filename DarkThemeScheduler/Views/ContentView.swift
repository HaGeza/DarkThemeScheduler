//
//  ContentView.swift
//  DarkThemeScheduler
//
//  Created by Pelok Balazs on 07/09/2024.
//

import SwiftUI

struct ContentView: View {
    // MOVE INSIDE VM:
//    private var customScheduleSetup: Schedule = .custom(6 * 3600, 20 * 3600)
//    private var sunsetScheduleSetup: Schedule = .sunset(0.0, 0.0)
//
//    @State private var selectedAutoSchedule: Schedule
    // ------------------

    @StateObject private var themeVM = ThemeViewModel()

//    init() {
//        _selectedAutoSchedule = State(initialValue: customScheduleSetup)
//    }

    private func handleChangeThemeResult(result: Result<Void, UIError>) {
        switch result {
        case .success:
            print("Theme Changed")
        case .failure(let error):
            print(error.message)
        }
    }

    private func getThemeButton(iconStr: String, theme: ThemeSelection) -> some View {
        Button(action: {
            themeVM.changeTheme(to: theme, handleChangeThemeResult)
        }) {
            Image(systemName: iconStr)
                .frame(width: 50, height: 50)
                .background(themeVM.selectedTheme == theme ? Color.blue.opacity(0.2) : Color.clear)
                .cornerRadius(10)
        }
    }

    var body: some View {
        VStack {
            HStack {
                Text("Theme")
                getThemeButton(iconStr: "sun.max.fill", theme: .light)
                getThemeButton(iconStr: "moon.stars.fill", theme: .dark)
                getThemeButton(iconStr: "circle.grid.cross.fill", theme: .auto)
            }
            .buttonStyle(PlainButtonStyle())
            .padding()

//            if themeVM.selectedTheme == .auto {
//                Picker("Auto Options", selection: $selectedAutoSchedule) {
//                    Text(customScheduleSetup.name).tag(customScheduleSetup.name)
//                    Text(sunsetScheduleSetup.name).tag(sunsetScheduleSetup.name)
//                }
//                .pickerStyle(MenuPickerStyle())
//                .padding()
//            }
        }
        .frame(width: 320, height: 240)
    }
}

#Preview {
    ContentView()
}
