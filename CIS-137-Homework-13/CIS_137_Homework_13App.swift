//
//  CIS_137_Homework_13App.swift
//  CIS-137-Homework-13
//
//  Created by Tyler Hager on 11/15/25.
//

import SwiftUI

@main
struct CIS_137_Homework_13App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MemoryGameViewModel())
        }
    }
}
