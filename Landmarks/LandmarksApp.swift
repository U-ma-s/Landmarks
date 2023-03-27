//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by umas on 2023/03/20.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()//アプリのライフタイム中に一度だけ、指定されたプロパティのモデルオブジェクトを初期化する

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
