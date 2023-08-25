//
//  WorkTabsHeader.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/23/23.
//

import SwiftUI

struct WorkTabsHeader: View {
    @Binding var currTab: WorkPage.Tabs
    var sectionsName = "Sections"
    
    var body: some View {
        HStack(spacing: 0) {
            GeometryReader { proxy in
                Button(action: { currTab = .details }) {
                    Text("Details".uppercased())
                        .font(.system(size: 14, weight: .bold))
                }
                .padding(.top)
                .foregroundStyle(Color.text)
                .frame(width: proxy.size.width)
                
                Rectangle()
                    .foregroundStyle(Color.white)
                    .frame(width: proxy.size.width, height: 4)
                    .padding(.top, proxy.size.height * 0.9)
                    .opacity(currTab == .details ? 1.0 : 0.0)
            }
            
            GeometryReader { proxy in
                Button(action: { currTab = .sections }) {
                    Text(sectionsName.uppercased())
                        .font(.system(size: 14, weight: .bold))
                }
                .padding(.top)
                .foregroundStyle(Color.text)
                .frame(width: proxy.size.width)
                
                Rectangle()
                    .foregroundStyle(Color.white)
                    .frame(width: proxy.size.width, height: 4)
                    .padding(.top, proxy.size.height * 0.9)
                    .opacity(currTab == .sections ? 1.0 : 0.0)
            }
                
            GeometryReader { proxy in
                Button(action: { currTab = .reviews }) {
                    Text("Reviews".uppercased())
                        .font(.system(size: 14, weight: .bold))
                }
                .padding(.top)
                .foregroundStyle(Color.text)
                .frame(width: proxy.size.width)
                
                Rectangle()
                    .foregroundStyle(Color.white)
                    .frame(width: proxy.size.width, height: 4)
                    .padding(.top, proxy.size.height * 0.9)
                    .opacity(currTab == .reviews ? 1.0 : 0.0)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 50)
        .overlay(Divider().frame(maxWidth: .infinity, maxHeight: 1).background(Color.gray.opacity(0.5)), alignment: .bottom)
    }
}
