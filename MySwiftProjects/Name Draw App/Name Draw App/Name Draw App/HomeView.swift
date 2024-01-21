//
//  HomeView.swift
//  Name Draw App
//
//  Created by Yusuf Demirtaş on 16.10.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var buttonDraw = "Draw"
    @State private var loadedNames: [String] = []
    @State private var buttonClear = "Clear"
    @State private var drawnNames: [String] = []
    @State private var currentPlayerName: String = "Lets Begin !!!"

    var body: some View {

        VStack(spacing: .zero) {
            
            Text("Name Draw Application")
                .foregroundColor(.black)
                .padding(.vertical,25)
                .padding(.horizontal,50)
                .overlay {
                RoundedRectangle(cornerRadius: 3)
                        .stroke(.black, lineWidth: 3)
                }
                .lineLimit(2)
                .padding(18)
                .background(.yellow)
                .overlay {
                RoundedRectangle(cornerRadius: 3)
                        .stroke(.black, lineWidth: 3)
                }
                .font(.title3).bold()
                .padding(.vertical,32)
                .padding(.horizontal, 16)
            
            HStack(spacing: .zero){
                
                            Spacer()
                
                            VStack(spacing: .zero){
                                Text(currentPlayerName)
                            }.font(.title)
                            Spacer()
                        }.padding(.vertical,200)
            
                           Spacer()
            HStack(spacing: .zero){
                Button(
                    action: {

                        buttonAction()
                    }
                    
                ) {
                    Text(buttonDraw)
                        .foregroundColor(.black)
                        .font(.headline)
                        .padding(.horizontal, 60)
                        .padding(.vertical,12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16).stroke(.black, lineWidth: 2)
                        }
                        .padding(.vertical,48)
                        .padding(.horizontal, 20)
                }
                
                
                
            }.onAppear{
                initilizeNames()
            }
        }
        
        Spacer()
        
    }
    func buttonAction(){
        if drawnNames.count < 3 {
            drawNameAction()
            } else {
            clearAction()
            }
            buttonDraw = drawnNames.count < 3 ?
            "Draw" : "Clear"
    }
    func initilizeNames(){
        // Loading 10 names
            loadedNames.append("Sarah")
            loadedNames.append("Jack")
            loadedNames.append("Mahmut")
            loadedNames.append("Yusuf")
            loadedNames.append("Micheal")
            loadedNames.append("Zehra")
            loadedNames.append("Logan")
            loadedNames.append("Dorothy")
            loadedNames.append("Aleyna")
            loadedNames.append("Ashley")
        
    }
    func drawNameAction(){
        if drawnNames.count < 3 && !loadedNames.isEmpty {
            let randomIndex = Int.random(in: 0..<loadedNames.count)
            let drawnName = loadedNames.remove(at: randomIndex)
            drawnNames.append(drawnName)
            currentPlayerName = drawnName
        }

    }
    func clearAction(){
        if drawnNames.count == 3  {
            loadedNames.append(contentsOf: drawnNames)
            drawnNames.removeAll()
            currentPlayerName = "Lets Begin !!!"
        }
        
    }
    
}

#Preview {
    HomeView()
}
