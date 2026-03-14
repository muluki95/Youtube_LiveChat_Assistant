//
//  ChatMessageRow.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/14/26.
//
import SwiftUI


struct ChatMessageRow: View {
    let message: ChatMessage
    var onTagUser:(ChatUser) -> Void
    
    var body: some View {
        HStack(){
            Text(message.user.username)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .onLongPressGesture {
                    onTagUser(message.user)
                }
            Text(message.message)
            
            Spacer()
        }
        .padding(.vertical, 5)
        
    }
    
}
