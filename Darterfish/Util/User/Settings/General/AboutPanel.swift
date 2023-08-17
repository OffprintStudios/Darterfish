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
                Button(action: copyToClipboard("1.0.0-beta.10")) {
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
                .foregroundStyle(Color.text)
            }
            
            Section("Docs") {
                Link(destination: URL(string: "https://docs.google.com/document/d/1qYEhhRVknvT9qw6cwZQ5JP72rKQgPpdM449hxP2PG3w/edit?usp=share_link")!) {
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
                }
                .foregroundStyle(Color.text)
                
                Link(destination: URL(string: "https://docs.google.com/document/d/1CaO3WEW4HWaKF2p_KPZmtCONDWB04dvgBD3k-kCDklI/edit?usp=share_link")!) {
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
                }
                .foregroundStyle(Color.text)
                
                Link(destination: URL(string: "https://docs.google.com/document/d/1i_YMayX0p61_nJGkUsT_BsHwHo-5NyV_QovcGKZr2e0/edit?usp=share_link")!) {
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
                }
                .foregroundStyle(Color.text)
                
                Link(destination: URL(string: "https://docs.google.com/document/d/17WFSgBsJ7GoNVYStY1Z5XUGSEXWaMUzCA4uAU4d1beA/edit?usp=share_link")!) {
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
                }
                .foregroundStyle(Color.text)
                
                Link(destination: URL(string: "https://docs.google.com/document/d/1zEEmR-tppI2oLE7wP2S0n_Yogtc7GUw7fANCYzYMbsA/edit?usp=share_link")!) {
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
                .foregroundStyle(Color.text)
            }
            
            Section("Funding") {
                Link(destination: URL(string: "https://www.patreon.com/offprintstudios")!) {
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
                }
                .foregroundStyle(Color.text)
                
                Link(destination: URL(string: "https://ko-fi.com/offprintstudios")!) {
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
                .foregroundStyle(Color.text)
            }
            
            Section("Connect") {
                Link(destination: URL(string: "https://github.com/OffprintStudios/Sailfish")!) {
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
                }
                .foregroundStyle(Color.text)
               
                Link(destination: URL(string: "https://mastodon.social/@ofmanyfigments")!) {
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
                }
                .foregroundStyle(Color.text)
                
                Link(destination: URL(string: "https://discord.gg/9cnSwfn")!) {
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
                .foregroundStyle(Color.text)
            }
            
            Section {
                VStack(alignment: .center) {
                    HStack {
                        Spacer()
                        Text("Made with")
                        Image("RemixIcon/HealthAndMedical/heart-line")
                        Text("by Offprint Studios")
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("© 2023 Alyx Mote")
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar { BackButton() }
    }
}
