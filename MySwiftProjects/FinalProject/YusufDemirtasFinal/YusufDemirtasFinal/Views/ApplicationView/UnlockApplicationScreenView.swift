//
//  UnlockApplicationScreenView.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//

import SwiftUI

struct UnlockApplicationScreenView: View {
    @StateObject var viewModel = UnlockApplicationScreenViewModel()
    @State private var isNavigating = false

    var body: some View {
        NavigationView {
            ZStack {
               
                Color.white.edgesIgnoringSafeArea(.all)

                ForEach(viewModel.numbers.indices, id: \.self) { index in
                    NumberBox(number: $viewModel.numbers[index], position: $viewModel.boxPositions[index])
                        .animation(.easeInOut, value: viewModel.boxPositions[index])
                }

                VStack {
        
                    Spacer()
                    NavigationLink(destination: RegionListView(), isActive: $isNavigating) {
                        Button("Continue") {
                            viewModel.saveState()
                            isNavigating = true
                        }
                    }.navigationBarTitle("Unlock Screen", displayMode: .inline)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
            }
        }
        .onAppear {
            viewModel.restoreState()
        }
    }
}

struct NumberBox: View {
    @Binding var number: Int
    @Binding var position: CGPoint

    var body: some View {
        Text("\(number)")
            .frame(width: 100, height: 100)
            .background(Color.blue)
            .cornerRadius(16)
            .foregroundColor(.white)
            .bold()
            .font(.system(size: 14))
            .position(position)
            .gesture(DragGesture()
                .onChanged { gesture in
                    self.position = gesture.location
                }
            )
    }
}


#Preview {
    UnlockApplicationScreenView()
}
