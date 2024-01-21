//
//  FuritListView.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 3.12.2023.
//

import SwiftUI

struct FruitListView: View {
    @State private var maxCalories: String = ""
    @ObservedObject private var viewModel = FruitListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter max calories", text: $maxCalories)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Search") {
                    viewModel.searchFruits(maxCalories: Int(maxCalories) ?? 0)
                }

                if viewModel.isLoading {
                    LoadingView()
                } else {
                    List(viewModel.fruits) { fruit in
                        NavigationLink(destination: FruitDetailsView(fruit: fruit)) {
                            FruitRowView(fruit: fruit)
                        }
                    }
                }
            }
            .navigationBarTitle("Fruits")
        }
    }
}

struct FruitListView_Previews: PreviewProvider {
    static var previews: some View {
        FruitListView()
    }
}
