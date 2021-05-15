//
//  ListSeparatorStyleNoneModifier.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import SwiftUI
import Combine

public struct ListSeparatorStyleNoneModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.onAppear {
            UITableView.appearance().separatorStyle = .none
        }.onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
}
