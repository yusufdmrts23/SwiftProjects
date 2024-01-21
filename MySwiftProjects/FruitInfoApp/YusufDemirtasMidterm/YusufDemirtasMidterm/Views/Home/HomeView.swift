//
//  ContentView.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 2.12.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            FruitListView()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
