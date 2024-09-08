//
//  ThemeViewModel.swift
//  DarkThemeScheduler
//
//  Created by Pelok Balazs on 08/09/2024.
//

import Foundation

class ThemeViewModel: ObservableObject {
    @Published var selectedTheme: ThemeSelection = .auto
    @Published var isLightTheme: Bool = false

    private let themeManager = ThemeManager()

    private func handleSetSystemThemeResult(_ result: Result<Void, ThemeChangeError>, _ completion: @escaping (Result<Void, UIError>) -> Void) {
        switch result {
        case .success:
            print("success")
            completion(.success(()))
        case .failure(let error):
            print("error: \(error)")
            completion(.failure(UIError(message: "Failed to change theme")))
        }
    }

    func changeTheme(to selection: ThemeSelection, _ completion: @escaping (Result<Void, UIError>) -> Void) {
        switch selection {
        case .light:
            themeManager.setSystemTheme(darkTheme: false) { result in
                self.handleSetSystemThemeResult(result, completion)
            }
        case .dark:
            themeManager.setSystemTheme(darkTheme: true) { result in
                self.handleSetSystemThemeResult(result, completion)
            }
        case .auto:
            themeManager.setAutoSysmteTheme()
        }
    }
}
