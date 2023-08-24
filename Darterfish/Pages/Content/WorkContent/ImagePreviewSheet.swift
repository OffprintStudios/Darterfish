//
//  ImagePreviewSheet.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/23/23.
//

import SwiftUI

struct ImagePreviewSheet: View {
    @Environment(\.dismiss) var dismiss
    let imageUrl: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { dismiss() }) {
                    Image("RemixIcon/System/close-line")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .foregroundStyle(Color.text)
            }
            .padding()
            Spacer()
            AsyncImage(url: URL(string: imageUrl)!) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                }
            }
            Spacer()
        }
        .background(Color("BackgroundColor").ignoresSafeArea())
    }
}
