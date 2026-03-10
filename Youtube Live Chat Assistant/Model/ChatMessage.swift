//
//  ChatMessage.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/10/26.
//

struct ChatMessage: Identifiable {
    
    let id: String
    let user: ChatUser
    let text: String
    //let timestamp: Date
    let mention: [ChatUser]?
    
}
