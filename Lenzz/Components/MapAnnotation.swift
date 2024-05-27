//
//  MapAnnotationView.swift
//  ShiftPilot1
//
//  Created by Aiden Yang on 2024/4/24.
//

import SwiftUI

struct MapAnnotation: View {
    // MARK: - PROPERTIES

    var location: UserLocation
    @State private var animation: Double = 0.0

    // MARK: - BODY

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 48, height: 48, alignment: .center)

            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 48, height: 48, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)

            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36, alignment: .center)
                .clipShape(Circle())
        } //: ZSTACK
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

// MARK: - PREVIEW

struct MapAnnotationView_Previews: PreviewProvider {
    static var locations: [UserLocation] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnnotation(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
