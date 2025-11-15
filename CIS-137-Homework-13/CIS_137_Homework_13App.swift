/*
 *  CIS-137
 *  Homework 13
 *  Tyler Hager
 *  November 15, 2025
 */

import SwiftUI

@main
struct CIS_137_Homework_13App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MemoryGameViewModel())
        }
    }
}
