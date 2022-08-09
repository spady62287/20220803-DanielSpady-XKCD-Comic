//
//  LoadedView.swift
//  20220803-DanielSpady-XKCD-Comic
//
//  Created by Daniel Spady on 2022-08-03.
//

import SwiftUI

struct LoadedView: View {

    init(url: URL) {
        remoteImage = BaseImage(url: url)
        remoteImage.load()
    }

    var body: some View {
        ZStack {
            switch remoteImage.loadingState {
                case .initial:
                    EmptyView()
                case .inProgress:
                    Text("Loading")
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                case .failure:
                    Text("Failed")
            }
        }
    }

    @ObservedObject private var remoteImage: BaseImage
}
