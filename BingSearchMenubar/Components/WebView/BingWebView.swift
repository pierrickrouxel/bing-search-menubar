//
//  BingWebView.swift
//  BingSearchMenubar
//
//  Created by Pierrick ROUXEL on 15/04/2023.
//

import SwiftUI

struct BingFeature {
    let rawValue: String
    
    static let chat = BingFeature(rawValue: "https://edgeservices.bing.com/edgesvc/chat?clientscopes=chat,noheader")
    
    static let compose = BingFeature(rawValue: "https://edgeservices.bing.com/edgesvc/compose?clientscopes=chat,coauthor,noheader")
}

struct BingWebView: View {
    let feature: BingFeature
    
    init(_ feature: BingFeature = .chat) {
        self.feature = feature
    }
    
    var body: some View {
        WebView(url: generateAuthCheckUrl(feature.rawValue))
            .customUserAgent(.macOsEdge)
            .cookies([
                HTTPCookie(properties: [
                    .domain: "edgeservices.bing.com",
                    .path: "/",
                    .name: "_RwBf",
                    .value: "_rwbf=mta=0&rc=9&rb=9&gb=0&rg=0&pc=9&mtu=0&rbb=0&g=0&cid=&clo=0&v=3&aof=0&o=0&p=bingcopilotwaitlist&c=MY00IA&t=5088&rwred=0&wls=2&lka=0&lkt=0&TH=",
                    .secure: "TRUE",
                    .expires: NSDate(timeIntervalSinceNow: 31556926)
                ])!
            ])
    }
    
    private func generateAuthCheckUrl(_ url: String) -> URL {
        let ruParam = generateAuthCheckRuParam(url).addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        
        return URL(string: "https://www.bing.com/rewards/authcheck?ru=\(ruParam)")!
    }
    
    private func generateAuthCheckRuParam(_ url: String) -> String {
        let escapedUrl = url.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!;
        
        return """
        /msrewards/api/v1/enroll\
        ?publ=BINGIP\
        &crea=MY00IA\
        &pn=bingcopilotwaitlist\
        &partnerId=BingRewards\
        &pred=true\
        &ru=\(escapedUrl)
        """
    }
}

struct BingWebView_Previews: PreviewProvider {
    static var previews: some View {
        BingWebView()
    }
}
