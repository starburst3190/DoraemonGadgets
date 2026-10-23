//
//  ContentView.swift
//  DoraemonGadgets
//
//  Created by Jack on 2026/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var gadgetIdx: Int? = nil
    @State private var isDrawing = false
    @State private var hasCard = false
    
    private var cardTransition: AnyTransition {
        .asymmetric(
            insertion: hasCard ? .move(edge: .trailing) : .drawCard,
            removal: .offset(x: -500))
    }

    var body: some View {
        ZStack {
            Color.doraemon.ignoresSafeArea()

            VStack {
                ZStack {
                    if let gadgetIdx {
                        GadgetView(gadget: gadgets[gadgetIdx])
                            .id(gadgetIdx)
                            .geometryGroup()
                            .transition(cardTransition)
                    } else {
                        ZStack {
                            GeometryReader { geo in
                                let scale = min(1, geo.size.width / 420)
                                DoraemonBodyView(collarWidth: geo.size.width / scale) { draw() }
                                    .scaleEffect(scale)
                                    .frame(width: geo.size.width, height: geo.size.height)
                            }
                            Text("點擊口袋抽出一個道具吧！")
                                .font(.system(size: 24, weight: .semibold))
                                .offset(y: 250)
                        }
                        .transition(.opacity)
                    }
                }
                .frame(maxHeight: .infinity)

                if gadgetIdx != nil {
                    HStack {
                        Button {
                            draw()
                        } label: {
                            Text("再抽一次")
                                .foregroundStyle(.black.opacity(isDrawing ? 0.3 : 1))
                                .padding(4)
                        }
                        .buttonStyle(.glassProminent)
                        .tint(.bell)
                        Button {
                            hasCard = false
                            withAnimation(nil) { gadgetIdx = nil }
                        } label: {
                            Text("回到首頁")
                                .padding(4)
                        }
                        .buttonStyle(.glass)
                    }
                    .font(.system(size: 20))
                    .disabled(isDrawing)
                    .transition(.opacity)
                }
            }
        }
    }

    private func draw() {
        guard !isDrawing else { return }
        isDrawing = true
        withAnimation(.spring(duration: 0.6, bounce: 0.2)) {
            gadgetIdx = gadgets.indices.filter { $0 != gadgetIdx }.randomElement()
        } completion: {
            isDrawing = false
            hasCard = true
        }
    }
}

struct DrawCardModifier: ViewModifier {
    let progress: Double   // 0 = 還在口袋裡，1 = 完全抽出
    func body(content: Content) -> some View {
        content
            .rotation3DEffect(.degrees((1 - progress) * 90), axis: (x: 0, y: 1, z: 0.2))
            .scaleEffect(progress)
            .offset(y: (1 - progress) * 200)
    }
}

extension AnyTransition {
    static var drawCard: AnyTransition {
            .modifier(active: DrawCardModifier(progress: 0),
                      identity: DrawCardModifier(progress: 1))
        }
}

#Preview {
    ContentView()
}
