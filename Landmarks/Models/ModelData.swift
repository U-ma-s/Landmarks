//
//  ModelData.swift
//  Landmarks
//
//  Created by umas on 2023/03/20.
//

import Foundation
import Combine

final class ModelData: ObservableObject {//観察対象のデータストアとなるオブジェクト(Observable Object?)？
    @Published var landmarks: [Landmark] = load("landmarkData.json")//observable objectのプロパティをpublishedに
    var hikes: [Hike] = load("hikeData.json")
}

func load<T: Decodable>(_ filename: String) -> T {//<T: Decodable>はDecodableπロトコルに準拠したあらゆる型Tを型引数に取る．同じ型Tをreturn．
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
