//
//  CustomTransition.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/19/23.
//

import SwiftUI

extension AnyTransition {
    struct SlideModifier: ViewModifier {
        let width: CGFloat
        @Binding var forward: Bool
        
        func body(content: Content) -> some View {
            content.offset(x: (forward ? 1 : -1) * width)
        }
    }
    
    static func dynamicSlide(forward: Binding<Bool>) -> AnyTransition {
        .asymmetric(
            insertion: .modifier(
                active: SlideModifier(width: UIScreen.main.bounds.width, forward: forward),
                identity: SlideModifier(width: 0, forward: .constant(true))
            ),
            removal: .modifier(
                active: SlideModifier(width: -UIScreen.main.bounds.width, forward: forward),
                identity: SlideModifier(width: 0, forward: .constant(true))
            )
        )
    }
}
