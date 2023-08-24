//
//  CardView.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 8/16/23.
//

import SwiftUI

struct CardView: View {
    let title: String
    let icon: Image
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            icon
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
        )
    }
}

struct CardView_Preview: PreviewProvider {
    static var previews: some View {
        CardView(title: "Some Test", icon: Image(systemName: "figure.surfing"))
            
    }
}
