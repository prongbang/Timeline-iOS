//
//  NavigationItemContainer.swift
//  Timeline
//
//  Created by Endtry on 15/5/2564 BE.
//

import Foundation
import SwiftUI

// How to use:
// struct ScreenView: View {
//    var body: some View {
//        NavigationItemContainer(title: "Title") {
//            VStack(spacing: 21) {
//                AppLogoView()
//                //...
//            }
//        }
//    }
// }
struct NavigationItemContainer<Content>: View where Content: View {
    private let title: String
    private let content: () -> Content
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image("back_icon") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
            Text("Go back")
        }
    }
    }
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9607843137, alpha: 1)).edgesIgnoringSafeArea(.all)
            content()
        }
        //               .navigationBarItems(leading: btnBack)
        //               .toolbar {
        //                   ToolbarItem(placement: .principal) {
        //                       HStack {
        //                           Image(systemName: "sun.min.fill")
        //                           Text("Title")
        //                               .font(.headline)
        //                               .foregroundColor(.orange)
        //                       }
        //                   }
        //               }
        .navigationBarTitle(self.title, displayMode: .inline)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(Color(#colorLiteral(red: 0.1960784197, green: 0.521568656, blue: 0.9294117689, alpha: 1)))
                }
            //            trailing: NavigationLink(destination: Text("Hello")) {
            //                Image(systemName: "goforward")
            //                    .foregroundColor(Color(#colorLiteral(red: 0.1960784197, green: 0.521568656, blue: 0.9294117689, alpha: 1)))
            //                    .onTapGesture {}
            //            }
        )
        .gesture(
            DragGesture(coordinateSpace: .local)
                .onEnded { value in
                    if value.translation.width > .zero
                        && value.translation.height > -30
                        && value.translation.height < 30 {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
        )
    }
    
    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
}

