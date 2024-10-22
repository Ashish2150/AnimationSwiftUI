//
//  SettingView.swift
//  SwiftDataDemo
//
//  Created by Ashish Maurya on 09/10/24.
//

import SwiftUI

struct SettingView: View {
    
    private let alterNativeimage : [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom"
    ]
    
    var body: some View {
        NavigationView {
            List {
                // MARK: - Header
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("HIKE")
                            .font(.system(size: 66.0, weight: .black))
                        Text("Editor choice").font(.system(size: 22, weight: .medium))
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80.0, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [
                        .customGreenLight,
                        .customGreenMedium,
                        .customGreenDark
                    ], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top, 8)
                
                // MARK: - Header Body
                VStack(spacing: 8){
                    Text("Where can you find perfect track")
                        .font(.system(.title2, weight: .heavy))
                    
                    Text("the hike which look gorgeous in phone that is better one when you actullay do there. The hike is not just about the beautiful scenery but also about the experience of being in nature. \n Find the best day hike")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boost! It's time for a walk.").fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [
                                .customGreenLight, .customGreenMedium
                            ], startPoint: .top, endPoint: .bottom)
                        )
                }.multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                    .frame(maxWidth: .infinity)
                    .listRowSeparator(.hidden)
                
                Section(
                    header: Text("Alternate Icons")
                ) {
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 8){
                            ForEach(alterNativeimage.indices, id: \.self){ image in
                                Button {
                                    UIApplication.shared.setAlternateIconName(alterNativeimage[image]) { error in
                                        
                                        print(alterNativeimage[image])
                                        if error != nil {
                                            print(error ?? "")
                                        }
                                        
                                    }
                                    print("hello")
                                } label: {
                                    Image("\(alterNativeimage[image])-Preview")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(16)
                                }
                                
                            }
                        }.padding(.top, 8)
                    }
                    Text("Choose your favorite collection icon from collection above")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                        .padding(.bottom, 12)
                    
                    
                }.listRowSeparator(.hidden)
                
                
                
                
                Section(
                    header: Text("ABOUT THE APP"),
                    footer: HStack {
                        Spacer()
                        Text("Copyright © 2024 all right reserved")
                        Spacer()
                    }
                        .padding(.vertical, 8)
                ) {
                    NavigationLink(destination: RestartView()) {
                        CustomListView(rowLabel: "Application", rowImage: "iphone", rowContent: "Hike", rowTint: .blue)
                    }
                    
                    CustomListView(rowLabel: "Compatibility", rowImage: "info.circle", rowContent: "iPhone, iPad", rowTint: .red)
                    CustomListView(rowLabel: "Technology", rowImage: "swift", rowContent: "Swift", rowTint: .orange)
                    CustomListView(rowLabel: "gear", rowImage: "swift", rowContent: "Swift", rowTint: .purple)
                    CustomListView(rowLabel: "Developer", rowImage: "ellipsis.curlybraces", rowContent: "Your name", rowTint: .red)
                    CustomListView(rowLabel: "Website", rowImage: "globe", rowContent: "Your name", rowTint: .blue)
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
