//
//  HomeView.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/10/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        @StateObject var viewModel = LiveChatViewModel()
        NavigationStack {
            VStack(spacing: 20){
                Text("Youtube Live Chat Assistant")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
                TextField("Enter Live Stream URL", text: $viewModel.streamURL)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button("Open Live Stream"){
                    viewModel.openStream()
                    
                }
                .buttonStyle(PlainButtonStyle())
                
                if viewModel.isLoading{
                    ProgressView("Loading Stream...")
                        .padding()
                }
                
                Spacer()
                NavigationLink(destination: LiveStreamView (url: viewModel.streamURL),
                isActive: $viewModel.navigateToStream
                ){
                    EmptyView()
                }
            }
            .padding()
            
            
        }
    }
}


#Preview{
    HomeView()
}
