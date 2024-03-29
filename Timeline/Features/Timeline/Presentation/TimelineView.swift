//
//  TimelineView.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

import SwiftUI

struct TimelineView: View {
    
    @ObservedObject var viewModel = TimelineViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9607843137, alpha: 1)).edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("MY\ntimeline")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(Color(#colorLiteral(red: 0.07843137255, green: 0.09019607843, blue: 0.3960784314, alpha: 1)))
                                .padding(.leading, 16)
                                .padding(.trailing, 16)
                            
                            Spacer().frame(height: 60)
                            
                            CardView {
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading) {
                                        Text("Last check in")
                                            .foregroundColor(Color(#colorLiteral(red: 0.1960784197, green: 0.521568656, blue: 0.9294117689, alpha: 1)))
                                        Group { () -> AnyView in
                                            if case TimelineState.TimelineLast(let timeline) = viewModel.state {
                                                return AnyView(
                                                    Text("\(timeline.address()), \(timeline.datetime())")
                                                        .foregroundColor(Color(#colorLiteral(red: 0.07843137255, green: 0.09019607843, blue: 0.3960784314, alpha: 1)))
                                                        .padding(.bottom, 24)
                                                )
                                            } else if case TimelineState.Loading = viewModel.state {
                                                return AnyView(ActivityIndicator(isAnimating: .constant(true), style: .medium))
                                            }
                                            return AnyView(Spacer())
                                        }
                                    }
                                    Spacer()
                                    VStack(alignment: .trailing) {
                                        Navigator.navigate(.detail) {
                                            Image("NextRounded")
                                                .aspectRatio(contentMode: .fit)
                                                .scaledToFit()
                                        }
                                    }
                                }
                            }
                            .padding()
                            
                            Spacer().frame(height: 40)
                            
                            CardView {
                                VStack(alignment: .leading) {
                                    if case LocationState.CurrentLocation(let location) = viewModel.location {
                                        AnyView(ListTile(
                                            image: Image("Location"),
                                            title: "Location",
                                            subtitle: location.address,
                                            reverse: true
                                        ))
                                    } else if case LocationState.LocationNotAllow = viewModel.location {
                                        AnyView(Text("Location Not Allow"))
                                    } else if case LocationState.LocationDisabled = viewModel.location {
                                        AnyView(Text("Location Disabled"))
                                    } else if case LocationState.Error = viewModel.location {
                                        AnyView(Text("Location Error"))
                                    } else {
                                        AnyView(Text("Cannot get location"))
                                    }
                                    Spacer().frame(height: 24)
                                    ListTile(
                                        image: Image("Calendar"),
                                        title: "Check In",
                                        subtitle: viewModel.currentDate,
                                        reverse: true
                                    )
                                }
                            }
                            .padding()
                            
                            Spacer().frame(height: 40)
                            
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                    Spacer()
                    
                    RoundedButton(text: "CHECK IN") {
                        print("Clicked")
                        self.viewModel.process(intent: .AddTimeline)
                    }
                }
            }
            .onAppear {
                self.viewModel.process(intent: .GetTimelineLast)
                self.viewModel.process(intent: .GetCurrentLocation)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
