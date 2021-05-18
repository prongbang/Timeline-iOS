//
//  TimelineListView.swift
//  Timeline
//
//  Created by Endtry on 14/5/2564 BE.
//

import SwiftUI

struct TimelineListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = TimelineListViewModel()
    
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
                        case .TimelineList(let timelines):
                            return AnyView(
                                ForEach(timelines, id: \.id) { item in
                                    CardView {
                                        ListTile(
                                            image: Image("Item"),
                                            text: item.day(),
                                            title: item.address(),
                                            subtitle: item.datetime()
                                        )
                                    }
                                    .padding(.bottom, 8)
                                    .padding(.top, 8)
                                    .padding(.leading, 16)
                                    .padding(.trailing, 16)
                                }
                            )
                        case .Error(_):
                            return AnyView(Text("Error"))
                        }
                    }
                }
            }
        }.onAppear {
            self.viewModel.process(intent: .GetTimelineList)
        }
    }
}

struct TimelineListView_Previews: PreviewProvider {
    
    static var previews: some View {
        TimelineListView()
    }
}
