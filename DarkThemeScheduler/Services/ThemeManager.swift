//
//  ThemeManager.swift
//  DarkThemeScheduler
//
//  Created by Pelok Balazs on 08/09/2024.
//

import Cocoa
import Foundation

class ThemeManager {
    func setSystemTheme(darkTheme: Bool, completion: @escaping (Result<Void, ThemeChangeError>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            if let script = NSAppleScript(source: "tell application \"System Events\" to tell preferences to set dark mode to \(darkTheme ? "true" : "false")") {
                var error: NSDictionary?
                script.executeAndReturnError(&error)

                if let error = error {
                    DispatchQueue.main.async {
                        completion(.failure(.appleScriptExecutionFailed(message: "\(error)")))
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(.success(()))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(.failure(.appleScriptCreationFailed))
                }
            }
        }
    }

    func setAutoSysmteTheme() {}
}
