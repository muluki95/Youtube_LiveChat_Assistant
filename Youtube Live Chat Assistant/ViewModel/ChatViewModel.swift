//
//  ChatViewModel.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/15/26.
//
import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = ChatMessage.mockMessages
    @Published var suggestions: [ChatUser] = []
    @Published var currentUser: ChatUser = .mary
    
    
    var allUsers: [ChatUser] {
      var users = Array(Set(messages.map{$0.user}))
        if !users.contains(currentUser) {
            users.append(currentUser)
            
        }
        return users
    }
    
    func sendMessage(_ text: String,_ user: ChatUser){
        //remove whitespace
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            return
        }
        
        let mentionedUsers = extractMentions(from: trimmed)
        
        var cleanedMessage = trimmed
        
        for mentionedUser in mentionedUsers {
            cleanedMessage = cleanedMessage.replacingOccurrences(
                    of: "@\(mentionedUser.username)",
                    with: mentionedUser.username,
                    options: .caseInsensitive
            )
        }
        
        let newMessage = ChatMessage(id: UUID().uuidString,
                                     user: user,
                                     message: cleanedMessage,
                                     mentions: mentionedUsers)
        messages.append(newMessage)
    }
    
    
    func updateSuggestions(for text: String) {
        //when you type @ show suggestions
        guard let lastWord = text.split(separator: " ").last, lastWord.starts(with: "@") else {
            suggestions = []
            return
            
        }
        //removing the @ from last word
        let query = lastWord.dropFirst().lowercased()
        
        if query.isEmpty {
            suggestions = allUsers
        } else {
            suggestions = allUsers.filter {
                $0.username.lowercased().contains(query)
            }
            
        }
    }
    
    func highlightedText(_ message: String) -> AttributedString {
        var attributed = AttributedString(message)
        
        for user in allUsers {
            let mention = user.username
            
            if let range = attributed.range(of: mention, options: .caseInsensitive){
                attributed[range].foregroundColor = .blue
                attributed[range].font = .system(size: 14, weight:.bold)
            }
        }
        return attributed
    }
    
    func extractMentions(from text: String) -> [ChatUser]{
        let words = text.split(separator: " ")
        
        return words.compactMap { word in
            guard word.starts(with: "@") else { return nil}
            
            let username = word.dropFirst().lowercased()
            
            return allUsers.first { $0.username.lowercased() == username.lowercased()}
            
        }
        
        
    }
}
