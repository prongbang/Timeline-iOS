//
//  Color+Extension.swift
//  Timeline
//
//  Created by Endtry on 13/5/2564 BE.
//

import Foundation
import SwiftUI

extension UIColor {
    convenience init(hex: Int, alpha: Double) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255,
            A: CGFloat(alpha)
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: components.A)
    }
}

extension Color {
    public init(hex: Int, alpha: Double = 1.0) {
        self.init(UIColor(hex: hex, alpha: alpha))
   }
}
