//
//  UserSheet.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import SwiftUI

struct UserSheet: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationView {
                Text("User Sheet View")
                    .navigationTitle("Profile & Settings")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: closeSheet) {
                                Image("RemixIcon/System/close-circle-line")
                                    .resizable()
                                    .frame(width: 26.0, height: 26.0)
                                    .foregroundStyle(Color("TextColor"))
                            }
                        }
                    }
            }
        }
    }
    
    func closeSheet() {
        isPresented = false
    }
}
