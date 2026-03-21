//
//  ContentView.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/10/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ChatViewModel
    var body: some View {
        HomeView()
    }
}

#Preview {
    ContentView()
        .environmentObject(ChatViewModel())
}
