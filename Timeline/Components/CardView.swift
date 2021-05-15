//
//  CardView.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import SwiftUI

struct CardView<Content>: View where Content: View {
    private let content: () -> Content
    private let background: Color
    private let cornerRadius: Float
    
    var body: some View {
        VStack {
            content()
        }
        .padding()
        .background(self.background)
        .clipShape(RoundedRectangle(cornerRadius: CGFloat(self.cornerRadius), style: .continuous))
    }
    
    init(background: Color = Color.white, cornerRadius: Float = 20, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.background = background
        self.cornerRadius = cornerRadius
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(background: Color.red) {
            Text("Card View")
        }
    }
}
