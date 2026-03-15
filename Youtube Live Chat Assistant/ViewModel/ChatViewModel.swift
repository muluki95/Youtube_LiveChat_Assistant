//
//  ChatViewModel.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/15/26.
//
import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = ChatMessage.mockMessages
    
    
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
    
}
