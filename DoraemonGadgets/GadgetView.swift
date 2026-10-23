//
//  GadgetView.swift
//  DoraemonGadgets
//
//  Created by Jack on 2026/10/20.
//

import SwiftUI

struct GadgetView: View {
    let gadget: Gadget
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                Image(gadget.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 14))
                    .containerRelativeFrame(.vertical) { height, _ in
                        height / 3
                    }
                Text(gadget.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack {
                    Text(gadget.japaneseName)
                        .foregroundStyle(.secondary)
                    Text(gadget.category)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 8)
                        .background(.collar.opacity(0.5), in: RoundedRectangle(cornerRadius: 4))
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .padding(.horizontal, 8)
            .background(.white, in: .rect(cornerRadius: 22))
            .overlay(RoundedRectangle(cornerRadius: 22).stroke(.black, lineWidth: 3))
            
            // 數據列：人氣排名、漫畫登場次數、初登場集數
            HStack(spacing: 12) {
                InfoBadge(title: "人氣排名", value: "第 \(gadget.popularityRank) 名")
                InfoBadge(title: "漫畫登場", value: "\(gadget.appearances) 次")
                InfoBadge(title: "初登場", value: "第 \(gadget.firstVolume) 集")
            }
            
            // 敘述，過長時改用 ScrollView
            ViewThatFits(in: .vertical) {
                Text(gadget.description)
                    .padding(4)
                ScrollView {
                    Text(gadget.description)
                        .padding(4)
                }
                .scrollEdgeEffectHidden(true, for: .all)
            }
            .frame(maxWidth: .infinity)
            .padding(8)
            .background(.white, in: .rect(cornerRadius: 22))
            .overlay(RoundedRectangle(cornerRadius: 22).stroke(.black, lineWidth: 3))
        }
        .padding(.horizontal, 20)
    }
}

struct InfoBadge: View {
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 2) {
            Text(title)
                .font(.caption.bold())
                .foregroundStyle(.secondary)
            Text(value)
                .font(.title3.bold())
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(.white, in: .rect(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(.black, lineWidth: 3))
    }
}

#Preview {
    GadgetView(gadget: gadgets[0])
}
