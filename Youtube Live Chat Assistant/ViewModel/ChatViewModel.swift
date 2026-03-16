//
//  ChatViewModel.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/15/26.
//
import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = ChatMessage.mockMessages
    
    
    var allUsers: [ChatUser] {
      Array(Set(messages.map{$0.user}))
    }
    
    func sendMessage(_ text: String,_ user: ChatUser){
        //remove whitespace
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            return
        }
        //convert to lowercase
        let lowercasedText = trimmed.lowercased()
        
        let newMessage = ChatMessage(id: UUID().uuidString,
                                     user: user,
                                     message: lowercasedText,
                                     mention: nil)
        messages.append(newMessage)
    }
    
    
    func updateSuggestions(for text: String) {
        //when you type @ show suggestions
        guard let lastWord = text.split(separator: "").last, lastWord.starts(with: "@") else {
            suggestions = []
            return
            
        }
        //removing the @ from last word
        let query = lastWord.dropFirst().lowercased()
        suggestions = allUsers.filter {$0.username.lowercased().contains(query)}
        
    }
    
    func highlightedText(_ message: String) -> AttributedString {
        var attributed = AttributedString(message)
        
        for user in viewModel.allUsers {
            let mention = "@ \(user.username)"
            
            if let range = attributed.range(of: mention){
                attributed[range].foregroundColor = .blue
                attributed[range].font = .system(size: 14, weight:.bold)
            }
        }
        return attributed
    }
}
