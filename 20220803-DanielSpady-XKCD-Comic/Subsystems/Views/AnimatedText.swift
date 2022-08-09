//
//  AnimatedText.swift
//  20220803-DanielSpady-XKCD-Comic
//
//  Created by Daniel Spady on 2022-08-09.
//

import SwiftUI

struct AnimatedText: View {
    var text: String
    
    var body: some View {
        Text(self.text)
            .font(Font.system(size: 96, weight: .regular, design: .monospaced))
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .foregroundColor(.blue)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .animation(.easeInOut)
    }
}
