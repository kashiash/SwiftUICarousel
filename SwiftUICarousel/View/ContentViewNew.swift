//
//  ContentViewNew.swift
//  SwiftUICarousel
//
//  Created by Jacek Kosinski U on 20/08/2023.
//

import SwiftUI


struct ContentViewNew: View {

    private let sampleTrips = [ "paris",
                                "florence",
                                "amsterdam",
                                "ghent",
                                "santorini",
                                "budapest",
                                "london",
                                "cuba",
                                "osaka",
                                "kyoto",
                                "seoul",
                                "sydney",
                                "hongkong" ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(sampleTrips, id: \.self) { trip in
                    VStack{
                        Image(trip)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 450)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .padding(.horizontal, 20)
                            .containerRelativeFrame(.horizontal)
                        Text("City: \(trip.capitalized)")
                    }

                }
            }
        }.scrollTargetBehavior(.paging)
    }
}

#Preview {
    ContentViewNew()
}
