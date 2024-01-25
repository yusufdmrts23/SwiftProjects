//
//  RegionDetailScreenView.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//


import SwiftUI
import MapKit

struct RegionDetailScreenView: View {
    @StateObject var viewModel = RegionDetailScreenViewModel()
    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.50, longitude: -98.35),
        span: MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
    )
    @State private var selectedLocation: MapLocation?

    var regionName: String

    var body: some View {
        VStack {


            Map(coordinateRegion: $mapRegion,
                annotationItems: viewModel.locations.map { MapLocation(location: $0) },
                annotationContent: { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        AnnotationView(location: location, selectedLocation: $selectedLocation)
                        
                    }
                
                }
            )
            .frame(height: 300)

            if let selectedLocation = selectedLocation {
                locationDetailView(location: selectedLocation.location)
            }
        }
        .onAppear {
            viewModel.loadLocations(for: regionName)
            
        }
        .onChange(of: viewModel.locations) { _ in
            updateMapRegion()
        }
    }

    private func updateMapRegion() {
        guard let firstLocation = viewModel.locations.first else {
            print("No locations available")
            return
        }

        let newRegion = MKCoordinateRegion(
            center: firstLocation.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("Updating map region to: \(newRegion)")
            self.mapRegion = newRegion
        }
    }
    private func locationDetailView(location: Location) -> some View {
        VStack {
            Text("Name: \(location.name)")
            Text("Address: \(location.street), \(location.city)")
            Text("Machines: \(location.machineCount)")
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
    }

}
