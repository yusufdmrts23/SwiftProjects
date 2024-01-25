//
//  AnnotationView.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//


import SwiftUI
import MapKit

struct AnnotationView: View {
    var location: MapLocation
    @Binding var selectedLocation: MapLocation?

    var body: some View {
        Button(action: {
            self.selectedLocation = location
        }) {
            Text(location.location.name)
                .font(.caption)
                .padding(5)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
        }
    }
}
