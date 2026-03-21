//
//  LiveChat.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/10/26.
//
import SwiftUI
struct LiveStreamView: View {
    
    let streamURL: String
    @EnvironmentObject var viewModel: ChatViewModel
    
    var body: some View {
        VStack{
            
            //WebView()
            WebView(urlString: streamURL)
                .frame(width:.infinity, height: 250)
            
            //ChatView()
            ChatView()
        }
        
    }
}
#Preview{
    LiveStreamView(streamURL: "https://www.youtube.com/watch?v=lhPwZmRPEeY")
        .environmentObject(ChatViewModel())
}
