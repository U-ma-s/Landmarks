//
//  ContentView.swift
//  Landmarks
//
//  Created by umas on 2023/03/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())//ModelData経由でデータを読み込む．
    }
}
