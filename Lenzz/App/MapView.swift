//
//  ContentView.swift
//  ShiftPilot1
//
//  Created by Aiden Yang on 2024/4/23.
//

import MapKit
import SwiftUI

struct MapView: View {
    // MARK: - PROPERTIES

    let locations: [UserLocation] = Bundle.main.decode("locations.json")

    @State private var region: MapCameraPosition = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 38.912123, longitude: 121.593845)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)

        return MapCameraPosition.region(mapRegion)
    }()

    @State private var selection: String?

    @State private var showDetailSheet = false

    // MARK: - BODY

    var body: some View {
        ZStack(alignment: .bottom) {
            Map(position: $region, selection: $selection) {
                ForEach(locations) { item in
                    // (A) PIN: OLD STYLE (always static)
                    Annotation(item.name, coordinate: item.location) {
                        MapAnnotation(location: item)
                    } //: ANNOTATION
                }
            }
            .edgesIgnoringSafeArea(.all)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0 ..< 10) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 200, height: 120)
                            .overlay(Text("\(index)").foregroundColor(.white))
                            .onTapGesture {
                                showDetailSheet.toggle()
                            }
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 120) // Set the height of the scroll view
            .padding(.bottom, 20) // Add some padding at the bottom
        }
        .sheet(isPresented: $showDetailSheet) {
            VStack {
                Text("hello")
            }
            .presentationDetents([.medium, .large])
        }
    }
}

// MARK: - PREVIEW

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
