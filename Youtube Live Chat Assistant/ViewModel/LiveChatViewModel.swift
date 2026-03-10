//
//  LiveChatViewModel.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/10/26.
//
import Foundation

class LiveChatViewModel: ObservableObject  {
    @Published var streamURL: String = ""
    @Published var isLoading: Bool = false
    @Published var navigateToStream: Bool = false
    
    
    func openStream() {
        guard let url = URL(string: streamURL), !streamURL.isEmpty else {
            return
        }
                isLoading = true
                
                // Simulate loading (like validating stream)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isLoading = false
                    self.navigateToStream = true
                }
        
    }
}
