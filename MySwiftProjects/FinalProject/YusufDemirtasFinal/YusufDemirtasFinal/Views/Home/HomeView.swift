//
//  HomeView.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 21.01.2024.
//

import SwiftUI
import MapKit

struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()

    var body: some View {

            UnlockApplicationScreenView()
    }
}

#Preview {
    HomeView()
}
