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
    @EnvironmentObject var viewModel: ChatViewModel
    var isMentioned: Bool {
        guard let mentions = message.mentions else {return false}
        return mentions.contains(viewModel.currentUser)
    }
    
    
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
            
            HStack(spacing: 4){
                Text(message.user.username)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .onLongPressGesture {
                        onTagUser(message.user)
                    }
                
                if isMentioned {
                    Text("@You")
                        .font(.caption)
                        .foregroundColor(.orange)
                }
                Text(viewModel.highlightedText(message.message))
                
            }
            .lineLimit(nil)
            
            Spacer()
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
        .background(isMentioned ? Color.yellow.opacity(0.2) : Color.clear)
        .cornerRadius(8)
        
    }
    
}
