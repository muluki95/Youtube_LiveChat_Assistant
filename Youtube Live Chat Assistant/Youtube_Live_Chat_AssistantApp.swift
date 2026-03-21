//
//  Youtube_Live_Chat_AssistantApp.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/10/26.
//

import SwiftUI

@main
struct Youtube_Live_Chat_AssistantApp: App {
    @StateObject var viewModel = ChatViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
