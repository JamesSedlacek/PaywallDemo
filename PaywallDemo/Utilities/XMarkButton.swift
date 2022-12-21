//
//  XMarkButton.swift
//  PaywallDemo
//
//  Created by James Sedlacek on 12/21/22.
//

import SwiftUI

struct XMarkButton: View {
    let onTap: () -> ()
    var body: some View {
        Button {
            onTap()
        } label: {
            Image.xmarkCircleIcon
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(Color.white.opacity(0.6),
                                 Color.secondary.opacity(0.4))
        }
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton(onTap: {})
    }
}
