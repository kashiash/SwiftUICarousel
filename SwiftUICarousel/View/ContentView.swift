

import SwiftUI

struct ContentView: View {

    @State private var isCardTapped = false

    var body: some View {
        HStack {
            ForEach(sampleTrips.indices, id: \.self) { index in
                TripCardView(destination: sampleTrips[index].destination, imageName: sampleTrips[index].image, isShowDetails: self.$isCardTapped)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
