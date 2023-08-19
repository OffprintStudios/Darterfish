//
//  TabNav.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/17/23.
//

import SwiftUI

enum Tabs: Int {
    case explore = 0
    case social = 1
    case library = 2
    case activity = 3
}

struct TabNav: View {
    @EnvironmentObject var userSettings: UserSettings
    @Binding var currTab: Tabs
    @State var guideSheetOpen = false
    let iconSize = 30.0
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            
            GeometryReader { geo in
                VStack(alignment: .center) {
                    Image("RemixIcon/Map/compass-discover-line")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                }
                .frame(width: geo.size.width, height: geo.size.height)
                
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(Color.white)
                    .frame(width: geo.size.width / 2, height: 4)
                    .padding(.leading, geo.size.width / 4)
                    .padding(.top, geo.size.height * 0.8)
                    .opacity(currTab == .explore ? 1.0 : 0.0)
            }
            .foregroundStyle(currTab == .explore ? Color.white : Color(userSettings.theme.accentLight))
            .onTapGesture {
                withAnimation(.spring(duration: 0.25)) {
                    currTab = .explore
                }
            }
            
            GeometryReader { geo in
                VStack(alignment: .center) {
                    Image("RemixIcon/UserAndFaces/team-line")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                }
                .frame(width: geo.size.width, height: geo.size.height)
                
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(Color.white)
                    .frame(width: geo.size.width / 2, height: 4)
                    .padding(.leading, geo.size.width / 4)
                    .padding(.top, geo.size.height * 0.8)
                    .opacity(currTab == .social ? 1.0 : 0.0)
            }
            .foregroundStyle(currTab == .social ? Color.white : Color(userSettings.theme.accentLight))
            .onTapGesture {
                withAnimation(.spring(duration: 0.25)) {
                    currTab = .social
                }
            }
            
            GeometryReader { geo in
                ZStack {
                    Circle()
                        .fill(Color.white.shadow(.drop(color: .black.opacity(0.5), radius: 5)))
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.75)
                    Image("RemixIcon/Arrows/arrow-up-s-line")
                        .resizable()
                        .frame(width: iconSize + 10, height: iconSize + 10)
                        .foregroundStyle(Color(userSettings.theme.accent))
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .onTapGesture {
                NotificationCenter.default.post(name: NSNotification.Name("OpenUserSheet"), object: nil)
            }
            
            GeometryReader { geo in
                VStack(alignment: .center) {
                    Image("RemixIcon/Business/bookmark-line")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                }
                .frame(width: geo.size.width, height: geo.size.height)
                
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(Color.white)
                    .frame(width: geo.size.width / 2, height: 4)
                    .padding(.leading, geo.size.width / 4)
                    .padding(.top, geo.size.height * 0.8)
                    .opacity(currTab == .library ? 1.0 : 0.0)
            }
            .foregroundStyle(currTab == .library ? Color.white : Color(userSettings.theme.accentLight))
            .onTapGesture {
                withAnimation(.spring(duration: 0.25)) {
                    currTab = .library
                }
            }
            
            GeometryReader { geo in
                VStack(alignment: .center) {
                    Image("RemixIcon/Media/notification-2-line")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                }
                .frame(width: geo.size.width, height: geo.size.height)
                
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(Color.white)
                    .frame(width: geo.size.width / 2, height: 4)
                    .padding(.leading, geo.size.width / 4)
                    .padding(.top, geo.size.height * 0.8)
                    .opacity(currTab == .activity ? 1.0 : 0.0)
            }
            .foregroundStyle(currTab == .activity ? Color.white : Color(userSettings.theme.accentLight))
            .onTapGesture {
                withAnimation(.spring(duration: 0.25)) {
                    currTab = .activity
                }
            }
            
            Spacer()
        }
        .background(Color(userSettings.theme.accent))
        .frame(height: 68)
        .ignoresSafeArea()
    }
}
