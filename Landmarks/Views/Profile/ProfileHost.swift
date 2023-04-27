//
//  ProfileHost.swift
//  Landmarks
//  
//  Created by umas on 2023/04/13
//  
//

import SwiftUI

struct ProfileHost: View {
    
    @State private var draftProfile = Profile.default
    @Environment(\.editMode) var editMode //`\.editMode`はSwiftUI内で定義されているenvironment key
    //var editModeを使用して，ビュー内で編集モードを管理できる．
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        
        //Text("Profile for \(draftProfile.username)")//ビューの更新不要なので`$`いらん
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())//このViewの子viewであるProfileSummary()が`@EnvironmentObject`を使用しているのでこのView内では使用しなくても.environmentObjectが必要
    }
}
