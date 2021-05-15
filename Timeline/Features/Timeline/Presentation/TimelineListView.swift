//
//  TimelineListView.swift
//  Timeline
//
//  Created by Endtry on 14/5/2564 BE.
//

import SwiftUI

struct TimelineListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = TimelineViewModel()
    
    var body: some View {
        NavigationItemContainer(title: "Timeline") {
            ScrollView {
                LazyVStack {
                    Group { () -> AnyView in
                        switch viewModel.state {
                        case .Init:
                            return AnyView(Spacer())
                        case .Loading:
                            return AnyView(
                                ActivityIndicator(isAnimating: .constant(true), style: .large)
                            )
                        case .Success(let timelines):
                            return AnyView(
                                ForEach(timelines, id: \.id) { item in
                                    CardView {
                                        ListTile(
                                            image: Image("Item"),
                                            text: "01",
                                            title: "The Mall Bangkae",
                                            subtitle: "01.08.2021 09:00"
                                        )
                                    }.padding()
                                }
                            )
                        case .Error(_):
                            return AnyView(Text("Error"))
                        }
                    }
                }
            }
        }.onAppear {
            self.viewModel.process(intent: .GetTimeline)
        }
    }
}

struct TimelineListView_Previews: PreviewProvider {
    
    static var previews: some View {
        TimelineListView()
    }
}
