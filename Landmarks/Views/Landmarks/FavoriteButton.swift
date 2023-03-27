//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by umas on 2023/03/22.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()//toggle()はbool値を反転させる
        } label: {
            Label ("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")//isSetがtrueならfill
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow: .gray)
        }
        
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
