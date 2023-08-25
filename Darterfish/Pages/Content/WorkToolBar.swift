//
//  WorkToolBar.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/24/23.
//

import SwiftUI

struct WorkToolBar: View {
    @Environment(\.dismiss) var dismiss
    @Binding var work: Work
    
    var body: some View {
        HStack {
            Button(action: { dismiss() }) {
                ZStack {
                    Circle()
                        .fill(.ultraThinMaterial)
                    Image("RemixIcon/System/close-line")
                        .frame(width: 14, height: 14)
                }
                .foregroundColor(Color.text)
                .frame(width: 34, height: 34)
            }
            
            Spacer()
            
            Button(action: addToLibrary) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.ultraThinMaterial)
                    HStack(spacing: 0) {
                        Image("RemixIcon/System/add-line")
                            .frame(width: 14, height: 14)
                            .padding(.trailing, 5)
                        Text("Library".uppercased())
                            .font(.system(size: 13))
                            .bold()
                    }
                }
                .foregroundColor(Color.text)
                .frame(width: 92, height: 34)
            }
            
            Menu {
                Button(action: { print("Add to Shelf") }) {
                    Image("RemixIcon/Business/bar-chart-fill")
                    Text("Add to Shelf")
                }
                if let title = work.title.slugify() {
                    ShareLink(item: URL(string: "https://offprint.net/work/\(work.id)/\(title)")!) {
                        Image("RemixIcon/System/share-box-line")
                        Text("Share This")
                    }
                }
                Divider()
                Button(role: .destructive, action: { print("Report") }) {
                    Image("RemixIcon/System/alarm-warning-line")
                    Text("Report")
                }
            } label: {
                ZStack {
                    Circle()
                        .fill(.ultraThinMaterial)
                    Image("RemixIcon/System/more-fill")
                        .frame(width: 14, height: 14)
                }
                .foregroundColor(Color.text)
                .frame(width: 34, height: 34)
            }
        }
        .padding(.top, 0)
        .padding(.leading)
        .padding(.trailing)
        .padding(.bottom, 10)
    }
}

extension WorkToolBar {
    func addToLibrary() {
        // TODO: implement add to library functionality
        print("Add to Library: \(work.id)")
    }
}
