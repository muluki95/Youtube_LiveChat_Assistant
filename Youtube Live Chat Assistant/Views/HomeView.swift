//
//  HomeView.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/10/26.
//

import SwiftUI

struct HomeView: View {
    @State private var streamURL: String = ""
    var body: some View {
        
        @StateObject var viewModel = LiveChatViewModel()
        NavigationStack {
            VStack(spacing: 20){
                Text("Youtube Live Chat Assistant")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
                TextField("Paste Live Stream URL", text: $streamURL)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                
                NavigationLink(destination: LiveStreamView (streamURL: streamURL)
                
                ){
                    Text("Open Live Stream")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                }
                .disabled(streamURL.isEmpty)
                Spacer()
            }
            .padding()
            
            
        }
    }
}


#Preview{
    HomeView()
}
