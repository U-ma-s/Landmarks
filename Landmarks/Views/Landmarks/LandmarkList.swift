//
//  LandmarkList.swift
//  Landmarks
//
//  Created by umas on 2023/03/20.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    var filterdLandmarks: [Landmark] {//filterdLandmarksに追加するのは以下の時の要素
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)//お気に入り関係なく全表示の時（この時は全ての要素を追加することになる）orその項目がお気に入りに含まれるとき
        }
    }
    var body: some View {
        NavigationView {
            //List(filterdLandmarks) { landmark in
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorite only")
                }
                ForEach (filterdLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
            }
            .navigationTitle("Landmarks")//title
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
