//
//  LoadingView.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 2.12.2023.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
        VStack(spacing: Spacing.spacing_1) {
            ProgressView()
            Text("Loading...")
        }
    }
}

#Preview {
    LoadingView()
}
