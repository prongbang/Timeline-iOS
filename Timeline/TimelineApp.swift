//
//  TimelineApp.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

import SwiftUI

@main
struct TimelineApp: App {
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color(#colorLiteral(red: 0.07843137255, green: 0.09019607843, blue: 0.3960784314, alpha: 1)))]
    }
    
    var body: some Scene {
        WindowGroup {
            TimelineView()
        }
    }
}
