//
//  RequestView.swift
//  Lenzz
//
//  Created by Aiden Yang on 2024/5/27.
//
import MapKit
import SwiftUI

struct RequestView: View {
    // MARK: - PROPERTIES

    @State private var region: MapCameraPosition = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 38.912123, longitude: 121.593845)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)

        return MapCameraPosition.region(mapRegion)
    }()

    // MARK: - BODY

    var body: some View {
        ZStack {
            Map(position: $region)
                .edgesIgnoringSafeArea(.all) // Extend map to the edges
            Image(systemName: "mappin")
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .shadow(radius: 10)
                .offset(x: 0, y: -15) // Offset to adjust the pin position
        }
    }
}

// MARK: - PREVIEW

struct RequestView_Previews: PreviewProvider {
    static var previews: some View {
        RequestView()
    }
}
