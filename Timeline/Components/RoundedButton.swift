//
//  RoundedButton.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import SwiftUI

struct RoundedButton: View {
    private let action: () -> Void
    private let text: String
    
    var body: some View {
        Button(action: self.action) {
            Text(self.text)
                .bold()
                .padding(4)
                .frame(maxWidth: .infinity)
        }
        .padding()
        .buttonStyle(GradientButtonStyle())
    }
    
    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(text: "Rounded Button") {
            print("Clicked")
        }
    }
}
