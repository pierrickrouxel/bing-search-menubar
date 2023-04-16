//
//  WebView.swift
//  BingSearch
//
//  Created by Pierrick ROUXEL on 12/04/2023.
//

import Foundation
import SwiftUI
import WebKit

struct UserAgent {
    let rawValue: String
    
    static let macOsEdge = UserAgent(rawValue: "Mozilla/5.0 (Macintosh; Intel Mac OS X 13_3_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.34")
}

class WKWebViewDeleagate: NSObject, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
           webView.isHidden = false
    }
}
 
struct WebView: NSViewRepresentable {
    let url: URL
    
    let webView = WKWebView()
    let navigationDelegate = WKWebViewDeleagate()
 
    func makeNSView(context: Context) -> WKWebView {
        webView.navigationDelegate = navigationDelegate
        webView.isHidden = true
        return webView
    }
 
    func updateNSView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func customUserAgent(_ customUserAgent: UserAgent) -> WebView {
        webView.customUserAgent = customUserAgent.rawValue
        return self
    }
    
    func cookies(_ cookies: [HTTPCookie]) -> WebView {
        cookies.forEach { cookie in
            webView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
        }
        return self
    }
}
