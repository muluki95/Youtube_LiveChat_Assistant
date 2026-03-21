//
//  ChatView.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/14/26.
//
import SwiftUI


struct ChatView: View {
    @State var chatInput: String = ""
    @State var suggestions:[ChatUser] = []
    @EnvironmentObject var viewModel: ChatViewModel
    
    //var messages: [ChatMessage] = ChatMessage.mockMessages
    
    var body: some View {
        VStack(spacing: 0) {
         
            ScrollView {
                ForEach(viewModel.messages) { message in
                    ChatMessageRow(message: message) { user in
                        if !chatInput.contains("@ \(user.username)"){
                            chatInput = "@\(user.username)"
                        }
                        
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

            if !suggestions.isEmpty {
                ScrollView(.horizontal){
                    HStack{
                        ForEach(suggestions){ user in
                            Button("@\(user.username)"){
                                chatInput += "@\(user.username)"
                                suggestions = []
                                
                            }
                            .padding(4)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                    }
                }
            }
            
        }
        .padding(.horizontal)
                
    }
    
}

#Preview{
    ChatView()
        .environmentObject(ChatViewModel())
}
