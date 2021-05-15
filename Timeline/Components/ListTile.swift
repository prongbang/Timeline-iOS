//
//  ListTile.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import SwiftUI

struct ListTile: View {
    private let title: String
    private let subtitle: String
    private let reverse: Bool
    private let image: Image
    private let text: String
    
    var body: some View {
        HStack(alignment: .center) {
            ZStack {
                self.image
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                if (self.text != "") {
                    Text(self.text)
                        .font(.title3)
                        .foregroundColor(Color(#colorLiteral(red: 0.1960784314, green: 0.5215686275, blue: 0.9294117647, alpha: 1)))
                        .bold()
                }
            }
            VStack(alignment: .leading) {
                Text(self.title)
                    .foregroundColor(reverse ? Color(#colorLiteral(red: 0.631372549, green: 0.631372549, blue: 0.631372549, alpha: 1)) : Color(#colorLiteral(red: 0.07843137255, green: 0.09019607843, blue: 0.3960784314, alpha: 1)))
                Text(self.subtitle)
                    .foregroundColor(reverse ? Color(#colorLiteral(red: 0.07843137255, green: 0.09019607843, blue: 0.3960784314, alpha: 1)) : Color(#colorLiteral(red: 0.631372549, green: 0.631372549, blue: 0.631372549, alpha: 1)))
            }.padding(.leading, 8)
            Spacer()
        }
    }
    init(image: Image, text: String = "", title: String, subtitle: String, reverse: Bool = false) {
        self.reverse = reverse
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.text = text
    }
}

struct ListTile_Previews: PreviewProvider {
    static var previews: some View {
        ListTile(
            image: Image("Item"),
            text: "00",
            title: "Location",
            subtitle: "London",
            reverse: true
        ).padding()
    }
}
