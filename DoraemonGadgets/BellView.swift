//
//  BellView.swift
//  DoraemonGadgets
//
//  Created by Jack on 2026/10/22.
//

import SwiftUI

struct BellView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.bell)
                .stroke(.black, lineWidth: 2)
            
            // 水平線
            Rectangle()
                .fill(.black)
                .frame(width: 120, height: 4)
                .offset(y: -25)

            // 小孔：在鈴鐺中心往下 20
            Circle()
                .fill(.black.opacity(0.5))
                .stroke(.black, lineWidth: 2)
                .frame(width: 26, height: 26)
                .offset(y: 20)

            // 垂直線：從小孔到鈴鐺底部
            Rectangle()
                .fill(.black)
                .frame(width: 4, height: 33)
                .offset(y: 49)
        }
        .frame(width: 130, height: 130)
    }
}
#Preview {
    BellView()
}
