//
//  AboutPanel.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/16/23.
//

import SwiftUI

struct AboutPanel: View {
    @Binding var iconSize: CGFloat
    @Binding var fontSize: CGFloat
    @Binding var fontOffset: CGFloat
    
    var body: some View {
        List {
            Section("Info") {
                HStack(alignment: .top) {
                    Image("RemixIcon/Development/code-line")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    VStack {
                        Text("Version")
                            .font(.custom("JosefinSans-Regular", size: fontSize))
                            .offset(y: fontOffset)
                    }
                    Spacer()
                    Text("1.0.0-beta.10")
                        .font(.custom("JosefinSans-Regular", size: (fontSize - 2.0)))
                        .offset(y: (fontOffset + 1.0))
                        .foregroundStyle(Color.gray)
                }
            }
            Section("Docs") {
                HStack(alignment: .top) {
                    Image("RemixIcon/Document/newspaper-line")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    VStack {
                        Text("Terms of Service")
                            .font(.custom("JosefinSans-Regular", size: fontSize))
                            .offset(y: fontOffset)
                    }
                    Spacer()
                    Image("RemixIcon/System/external-link-line")
                        .resizable()
                        .frame(width: (iconSize - 4.0), height: (iconSize - 4.0))
                        .offset(y: 1.5)
                        .foregroundStyle(Color.gray)
                }
                HStack(alignment: .top) {
                    Image("RemixIcon/System/lock-2-line")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    VStack {
                        Text("Privacy Policy")
                            .font(.custom("JosefinSans-Regular", size: fontSize))
                            .offset(y: fontOffset)
                    }
                    Spacer()
                    Image("RemixIcon/System/external-link-line")
                        .resizable()
                        .frame(width: (iconSize - 4.0), height: (iconSize - 4.0))
                        .offset(y: 1.5)
                        .foregroundStyle(Color.gray)
                }
                HStack(alignment: .top) {
                    Image("RemixIcon/Document/file-paper-2-line")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    VStack {
                        Text("Offprint Constitution")
                            .font(.custom("JosefinSans-Regular", size: fontSize))
                            .offset(y: fontOffset)
                    }
                    Spacer()
                    Image("RemixIcon/System/external-link-line")
                        .resizable()
                        .frame(width: (iconSize - 4.0), height: (iconSize - 4.0))
                        .offset(y: 1.5)
                        .foregroundStyle(Color.gray)
                }
                HStack(alignment: .top) {
                    Image("RemixIcon/Document/article-line")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    VStack {
                        Text("Offprint Omnibus")
                            .font(.custom("JosefinSans-Regular", size: fontSize))
                            .offset(y: fontOffset)
                    }
                    Spacer()
                    Image("RemixIcon/System/external-link-line")
                        .resizable()
                        .frame(width: (iconSize - 4.0), height: (iconSize - 4.0))
                        .offset(y: 1.5)
                        .foregroundStyle(Color.gray)
                }
                HStack(alignment: .top) {
                    Image("RemixIcon/System/question-line")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    VStack {
                        Text("What is Offprint?")
                            .font(.custom("JosefinSans-Regular", size: fontSize))
                            .offset(y: fontOffset)
                    }
                    Spacer()
                    Image("RemixIcon/System/external-link-line")
                        .resizable()
                        .frame(width: (iconSize - 4.0), height: (iconSize - 4.0))
                        .offset(y: 1.5)
                        .foregroundStyle(Color.gray)
                }
            }
            Section("Funding") {
                HStack(alignment: .top) {
                    Image("RemixIcon/Logos/patreon-fill")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    VStack {
                        Text("Patreon")
                            .font(.custom("JosefinSans-Regular", size: fontSize))
                            .offset(y: fontOffset)
                    }
                    Spacer()
                    Image("RemixIcon/System/external-link-line")
                        .resizable()
                        .frame(width: (iconSize - 4.0), height: (iconSize - 4.0))
                        .offset(y: 1.5)
                        .foregroundStyle(Color.gray)
                }
                HStack(alignment: .top) {
                    Image("RemixIcon/Map/cup-fill")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    VStack {
                        Text("Ko-Fi")
                            .font(.custom("JosefinSans-Regular", size: fontSize))
                            .offset(y: fontOffset)
                    }
                    Spacer()
                    Image("RemixIcon/System/external-link-line")
                        .resizable()
                        .frame(width: (iconSize - 4.0), height: (iconSize - 4.0))
                        .offset(y: 1.5)
                        .foregroundStyle(Color.gray)
                }
            }
            Section("Connect") {
                HStack(alignment: .top) {
                    Image("RemixIcon/Logos/github-fill")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    VStack {
                        Text("GitHub")
                            .font(.custom("JosefinSans-Regular", size: fontSize))
                            .offset(y: fontOffset)
                    }
                    Spacer()
                    Image("RemixIcon/System/external-link-line")
                        .resizable()
                        .frame(width: (iconSize - 4.0), height: (iconSize - 4.0))
                        .offset(y: 1.5)
                        .foregroundStyle(Color.gray)
                }
                HStack(alignment: .top) {
                    Image("RemixIcon/Logos/mastodon-fill")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    VStack {
                        Text("Mastodon")
                            .font(.custom("JosefinSans-Regular", size: fontSize))
                            .offset(y: fontOffset)
                    }
                    Spacer()
                    Image("RemixIcon/System/external-link-line")
                        .resizable()
                        .frame(width: (iconSize - 4.0), height: (iconSize - 4.0))
                        .offset(y: 1.5)
                        .foregroundStyle(Color.gray)
                }
                HStack(alignment: .top) {
                    Image("RemixIcon/Logos/discord-fill")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    VStack {
                        Text("Discord")
                            .font(.custom("JosefinSans-Regular", size: fontSize))
                            .offset(y: fontOffset)
                    }
                    Spacer()
                    Image("RemixIcon/System/external-link-line")
                        .resizable()
                        .frame(width: (iconSize - 4.0), height: (iconSize - 4.0))
                        .offset(y: 1.5)
                        .foregroundStyle(Color.gray)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar { BackButton() }
    }
}
