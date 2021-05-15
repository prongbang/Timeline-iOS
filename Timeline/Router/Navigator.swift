//
//  Navigator.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import SwiftUI

// How to use:
// #1
//  Navigator.navigate(.detail) {
//    Image("NextRounded")
//        .aspectRatio(contentMode: .fit)
//        .scaledToFit()
//  }
// #2
//  Button(action: {}, label: {
//      Navigator.navigate(.detail) {
//          Image("NextRounded")
//              .aspectRatio(contentMode: .fit)
//              .scaledToFit()
//      }
//  })
struct Navigator {
    static func navigate<T: View>(_ route: Route, content: ()-> T) -> AnyView {
        switch route {
        case .detail:
            return AnyView(NavigationLink(destination: TimelineListView()) {
                content()
            })
        }
    }
}
