//
//  ProfileSummary.swift
//  Landmarks
//  
//  Created by umas on 2023/04/13
//  
//

import SwiftUI

struct ProfileSummary: View {
    
    var profile: Profile
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading,spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Nortifications: \(profile.prefersNotifications ? "On": "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Data: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
                
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.deafault)
            .environmentObject(ModelData())
    }
}
