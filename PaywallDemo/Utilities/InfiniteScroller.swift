//
//  InfiniteScroller.swift
//  MyTradingJournal
//
//  Created by James Sedlacek on 11/22/22.
//

import SwiftUI

struct InfiniteScroller<Content: View>: View {
    
    enum Direction {
        case forward
        case backward
    }
    
    let contentWidth: CGFloat
    let direction: Direction
    var content: (() -> Content)
    @State private var xOffset: CGFloat = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    content()
                    content()
                }
                .offset(x: xOffset, y: 0)
        }
        .disabled(true)
        .onAppear {
            xOffset = direction == .forward ? 0 : -contentWidth
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                xOffset = direction == .forward ? -contentWidth : 0
            }
        }
    }
}
