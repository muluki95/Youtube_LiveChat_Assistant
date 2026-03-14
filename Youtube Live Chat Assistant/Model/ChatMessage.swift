//
//  ChatMessage.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/10/26.
//

struct ChatMessage: Identifiable {
    
    let id: String
    let user: ChatUser
    let message: String
    let mention: [ChatUser]?
    
}

extension ChatMessage {
    static let mockMessages: [ChatMessage] = [
        ChatMessage(
                    id: "m1",
                    user: .john,
                    message: "Hello everyone!",
                    mention: nil
                ),
                
                ChatMessage(
                    id: "m2",
                    user: .esther,
                    message: "Hi John!",
                    mention: [.john]
                ),
                
                ChatMessage(
                    id: "m3",
                    user: .alex,
                    message: "This stream is amazing 🔥",
                    mention: nil
                ),
               ChatMessage(
                    id: "m4",
                    user: .mary,
                    message: "Alex did you see that part?",
                    mention: [.alex]
                ),
                
                ChatMessage(
                    id: "m5",
                    user: .john,
                    message: "Yes Mary that was crazy!",
                    mention: [.mary]
                )
                
        
    ]
}
