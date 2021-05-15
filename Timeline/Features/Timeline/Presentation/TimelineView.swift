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
                                        Text("The Mall Bangkae, 01.08.2021 09:00")
                                            .foregroundColor(Color(#colorLiteral(red: 0.07843137255, green: 0.09019607843, blue: 0.3960784314, alpha: 1)))
                                            .padding(.bottom, 24)
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
                                    ListTile(
                                        image: Image("Location"),
                                        title: "Location",
                                        subtitle: "London",
                                        reverse: true
                                    )
                                    Spacer().frame(height: 24)
                                    ListTile(
                                        image: Image("Calendar"),
                                        title: "Check In",
                                        subtitle: "01.08.2021 09.00",
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
                    }
                }
            }
            .onAppear {
                
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
