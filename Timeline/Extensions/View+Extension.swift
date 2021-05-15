//
//  List+Extension.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import Foundation
import SwiftUI
import UIKit

extension View {
    func removeSeparator() -> some View {
        if #available(iOS 14.0, *) {
            return AnyView {
                self.listStyle(SidebarListStyle())
            }
        } else {
            return AnyView {
                self.onAppear {
                    UITableView.appearance().separatorStyle = .none
                }
            }
        }
    }
    
    public func listSeparatorStyleNone() -> some View {
        modifier(ListSeparatorStyleNoneModifier())
    }
    
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}
