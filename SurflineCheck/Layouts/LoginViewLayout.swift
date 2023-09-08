//
//  LoginViewLayout.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 9/8/23.
//

import Foundation
import SwiftUI

struct LoginViewLayout: Layout {
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return proposal.replacingUnspecifiedDimensions()
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        precondition(subviews.count == 3)

        var p = bounds.origin
        let h0 = bounds.size.height * 0.43
        subviews[0].place(
            at: p,
            proposal: .init(width: bounds.size.width, height: h0)
        )
        p.y += h0

        let h1 = bounds.size.height * 0.37
        subviews[1].place(
            at: p,
            proposal: .init(width: bounds.size.width, height: h1)
        )
        p.y += h1

        subviews[2].place(
            at: p,
            proposal: .init(
                width: bounds.size.width,
                height: bounds.size.height - h0 - h1
            )
        )
    }
}

/*
struct LoginViewLayout_Preview: PreviewProvider {
    static var previews: some View {
        LoginViewLayout()
    }
}
*/
