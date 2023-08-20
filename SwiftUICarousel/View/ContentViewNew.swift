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

    @State private var searchtext: String = ""

    var body: some View {
        ScrollView(.vertical) {
            VStack (spacing: 15){
                HStack(spacing: 12) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title)
                            .foregroundStyle(.blue)
                    })
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyinglass")
                            .foregroundStyle(.gray)

                        TextField("Search",text: $searchtext)
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(.ultraThinMaterial,in: .capsule)
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentViewNew()
}
