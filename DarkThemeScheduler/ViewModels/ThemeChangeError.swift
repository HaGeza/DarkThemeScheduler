//
//  ThemeSelectionError.swift
//  DarkThemeScheduler
//
//  Created by Pelok Balazs on 08/09/2024.
//

import Foundation

enum ThemeChangeError: Error {
    case appleScriptCreationFailed
    case appleScriptExecutionFailed(message: String)
}
