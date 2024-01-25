//
//  RegionListView.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//

import SwiftUI
import Foundation

struct RegionListView: View {
    @StateObject private var viewModel = RegionListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.regions) { region in
                NavigationLink(destination: RegionDetailScreenView(regionName: region.name)) {
                    
                    VStack(alignment: .leading) {
                        Text("Region Name:").font(.headline)
                        Text(region.name).font(.subheadline)
                        Text("Region State:").font(.headline)
                        Text(region.state).font(.subheadline)
                        Text("Region motd:").font(.headline)
                        if let motd = region.motd {
                            Text(motd).font(.caption)
                        }
                    }
                }
            }
            .navigationBarTitle("Pinball Regions", displayMode: .large)
            .onAppear {
                viewModel.loadRegions()
            }
        }
    }
}

#Preview {
    RegionListView()
}
