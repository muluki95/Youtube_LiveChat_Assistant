//
//  ChatMessageRow.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/14/26.
//
import SwiftUI
import Kingfisher



struct ChatMessageRow: View {
    let message: ChatMessage
    var onTagUser:(ChatUser) -> Void
    
    var body: some View {
        HStack(){
            if let url = message.user.profileImageURL,
               let imageURL = URL(string: url) {

                KFImage(imageURL)
                    .placeholder {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 30, height: 30)
                    }
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())

            } else {

                Circle()
                    .fill(Color.gray)
                    .frame(width: 30, height: 30)

            }
            
            VStack{
                Text(message.user.username)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .onLongPressGesture {
                        onTagUser(message.user)
                    }
                Text(highlightedText(message.message))
            }
        Spacer()
            
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
        
    }
    
}
