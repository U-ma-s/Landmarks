//
//  Profile.swift
//  Landmarks
//  
//  Created by umas on 2023/04/13
//  
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")//``はswiftの予約後"default"を回避するために必要
    
    enum Season: String, Identifiable, CaseIterable{
        case spring = "🌸"
        case summer = "🌞"
        case autumn = "🍁"
        case winter = "☃️"
        
        var id: String { rawValue }//各ケースの値をそのままidとするとき，enumの定義に`: String`をつけ，`var id: String {rawValue}`とする．
        //let season = Season.winter
        //print(season.id)
        // >> ☃️
    }
}
