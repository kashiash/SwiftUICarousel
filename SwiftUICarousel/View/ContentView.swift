

import SwiftUI

struct ContentView: View {

    @State private var isCardTapped = false
    @State private var currentTripIndex = 2
    @GestureState private var dragOffset: CGFloat = 0

    var body: some View {
        GeometryReader { outerView in
            HStack(spacing: 0) {
                ForEach(sampleTrips.indices, id: \.self) { index in
                    GeometryReader { innerView in
                        TripCardView(destination: sampleTrips[index].destination, imageName: sampleTrips[index].image, isShowDetails: self.$isCardTapped)
                    }
                    //.frame(width: outerView.size.width, height: 500)
                    .frame(width: outerView.size.width, height: self.currentTripIndex == index ? (self.isCardTapped ? outerView.size.height : 450) : 400)
                }
            }
            .padding(.horizontal, self.isCardTapped ? 0 : 20)
            .frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
            .offset(x: -CGFloat(self.currentTripIndex) * outerView.size.width)
            .offset(x: self.dragOffset)
            .gesture(
                !self.isCardTapped ?

                DragGesture()
                    .updating(self.$dragOffset, body: { (value, state, transaction) in
                        state = value.translation.width
                    })
                    .onEnded({ (value) in
                        let threshold = outerView.size.width * 0.65
                        var newIndex = Int(-value.translation.width / threshold) + self.currentTripIndex
                        newIndex = min(max(newIndex, 0), sampleTrips.count - 1)

                        self.currentTripIndex = newIndex
                    })

                : nil
            )
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
