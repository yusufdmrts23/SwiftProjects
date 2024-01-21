//
//  FuritDetailView.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 3.12.2023.
//

import SwiftUI

struct FruitDetailsView: View {
    var fruit: Fruit
    @State private var isShowingNutrition = false 

    var body: some View {
        VStack {

            Text("Name: \(fruit.name)")
                .font(.largeTitle)
            Text("Family: \(fruit.family)")
                .font(.title)
            Text("Genus: \(fruit.genus)")
                .font(.title)


            Spacer()

            Button("Nutrition") {
                isShowingNutrition.toggle()
            }
            .sheet(isPresented: $isShowingNutrition) {
                NutritionInfoView(fruitName: "\(fruit.name)")

            }
        }
    }
}
