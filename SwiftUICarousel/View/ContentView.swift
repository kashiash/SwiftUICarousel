

import SwiftUI

struct ContentView: View {

    @State private var isCardTapped = false

    var body: some View {
        GeometryReader { outerView in
            HStack {
                ForEach(sampleTrips.indices, id: \.self) { index in
                    GeometryReader { innerView in
                        TripCardView(destination: sampleTrips[index].destination, imageName: sampleTrips[index].image, isShowDetails: self.$isCardTapped)
                    }
                    .frame(width: outerView.size.width, height: 500)
                }
            }
            .frame(width: outerView.size.width, height: outerView.size.height)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
