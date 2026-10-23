//
//  DoraemonBodyView.swift
//  DoraemonGadgets
//
//  Created by Jack on 2026/10/22.
//

import SwiftUI

struct DoraemonBodyView: View {
    let collarWidth: CGFloat
    let onPocketTap: () -> Void
    @State private var pocketScale = 1.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .stroke(.black, lineWidth: 2)
                .frame(width: 400, height: 400)
            
            // 項圈
            Capsule()
                .fill(.collar)
                .stroke(.black, lineWidth: 2)
                .frame(width: collarWidth, height: 40)
                .offset(y: -185)
            
            BellView()
                .offset(y: -140)
            
            PocketShape()
                .fill(.white)
                .stroke(.black, lineWidth: 2)
                .frame(width: 320, height: 160)
                .offset(y: 80)
                .scaleEffect(pocketScale)
                .onTapGesture {
                    withAnimation(.spring(duration: 0.15)) {
                        pocketScale = 1.1
                    } completion: {
                        withAnimation(.spring(duration: 0.15)) {
                            pocketScale = 1.0
                        } completion: {
                            onPocketTap()
                        }
                    }
                }
        }
    }
}

#Preview {
    DoraemonBodyView(collarWidth: .infinity, onPocketTap: {})
}
