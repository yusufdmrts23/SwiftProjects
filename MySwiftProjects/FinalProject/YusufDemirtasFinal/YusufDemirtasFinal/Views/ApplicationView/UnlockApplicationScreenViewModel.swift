//
//  UnlockApplicationScreenViewModel.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//

import Foundation
import SwiftUI

class UnlockApplicationScreenViewModel: ObservableObject {
    @Published var boxPositions: [CGPoint] = Array(repeating: CGPoint(x: 50, y: 100), count: 3)
    @Published var numbers: [Int] = (1...3).map { _ in Int.random(in: 1...10) }

    private let positionsKey = "boxPositions"
    private let numbersKey = "boxNumbers"

    init() {
        restoreState()
    }

    func saveState() {
        let positionsData = try? JSONEncoder().encode(boxPositions)
        UserDefaults.standard.set(positionsData, forKey: positionsKey)
        UserDefaults.standard.set(numbers, forKey: numbersKey)
    }

    func restoreState() {
        if let positionsData = UserDefaults.standard.data(forKey: positionsKey),
           let savedPositions = try? JSONDecoder().decode([CGPoint].self, from: positionsData),
           let savedNumbers = UserDefaults.standard.array(forKey: numbersKey) as? [Int] {
            boxPositions = savedPositions
            numbers = savedNumbers
        }
    }

    func generateRandomNumbers() {
        numbers = (1...3).map { _ in Int.random(in: 1...10) }
    }
}
