//
//  WebView.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/13/26.
//
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let urlString: String
    func makeUIView(context: Context) -> WKWebView{
        let webView = WKWebView()
        
        if let url = URL(string: urlString) {
                    let request = URLRequest(url: url)
                    webView.load(request)
                }
        
        
        return webView
        
    }

    func updateUIView(_ uiView: WKWebView, context: Context){
        
    }
}
