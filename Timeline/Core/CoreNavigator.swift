//
//  Navigator.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import Foundation

protocol Navigator {
    static func navigate<T: View>(_ route: Route, content: ()-> T) -> AnyView
}
