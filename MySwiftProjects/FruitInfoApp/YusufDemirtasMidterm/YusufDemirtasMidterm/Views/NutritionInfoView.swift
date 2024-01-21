//
//  NutritionInfoView.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 3.12.2023.
//

import SwiftUI

struct NutritionInfoView: View {
    var fruitName: String
    let randomInt = Int.random(in: 100..<200)
    let randomInt1 = Int.random(in: 1..<20)
    let randomInt2 = Int.random(in: 1..<15)
    let randomInt3 = Int.random(in: 1..<15)
    var body: some View {
        VStack {
            Text("Nutrition Information for \(fruitName)")
                .font(.title)
                .padding()

            Text("Calories: \(randomInt)")
                .font(.headline)
            Text("Protein: \(randomInt1)")
                .font(.headline)
            Text("Carbohydrates: \(randomInt2)")
                .font(.headline)
            Text("Fat: \(randomInt3)")
                .font(.headline)


            Spacer()
        }
        .padding()
    }
}

struct NutritionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionInfoView(fruitName: "Apple") 
    }
}
