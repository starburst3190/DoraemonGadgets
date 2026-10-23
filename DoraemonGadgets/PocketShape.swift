//
//  PocketShape.swift
//  DoraemonGadgets
//
//  Created by Jack on 2026/10/20.
//

import SwiftUI

struct PocketShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.addArc(center: CGPoint(x: rect.midX, y: rect.minY),
                     radius: rect.width / 2,
                     startAngle: .degrees(-5),
                     endAngle: .degrees(185),
                     clockwise: false)
            p.closeSubpath()
        }
    }
}

#Preview {
    PocketShape()
}
