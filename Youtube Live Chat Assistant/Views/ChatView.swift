//
//  ChatView.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/14/26.
//
import SwiftUI


struct ChatView: View {
    @State var chatInput: String = ""
    @StateObject var viewModel = ChatViewModel()
    
    //var messages: [ChatMessage] = ChatMessage.mockMessages
    
    var body: some View {
        VStack(spacing: 0) {
         
            ScrollView {
                ForEach(viewModel.messages) { message in
                    ChatMessageRow(message: message) { user in
                        chatInput = "@\(user.username)"
                        
                    }
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack {
                TextField("Type your message...", text: $chatInput)
                    .textFieldStyle(.roundedBorder)
                    .frame(maxWidth: .infinity)

                Button("Send") {
                    viewModel.sendMessage( chatInput, .mary)
                    // clears the input field after sending
                    chatInput = ""
                }
            }
            .padding()

            
            
        }
        .padding(.horizontal)
                
    }
    
}

#Preview{
    ChatView()
}
