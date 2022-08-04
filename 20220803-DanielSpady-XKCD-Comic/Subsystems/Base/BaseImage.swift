//
//  BaseImage.swift
//  20220803-DanielSpady-XKCD-Comic
//
//  Created by Daniel Spady on 2022-08-03.
//

import SwiftUI
import Combine

class BaseImage: ObservableObject {

    enum LoadingState {
        case initial
        case inProgress
        case success(_ image: Image)
        case failure
    }

    @Published var loadingState: LoadingState = .initial

    let url: URL

    init(url: URL) {
        self.url = url
    }

    func load() {
        loadingState = .inProgress

        cancellable = URLSession(configuration: .default)
            .dataTaskPublisher(for: url)
            .map {
                guard let value = UIImage(data: $0.data) else {
                    return .failure
                }
                return .success(Image(uiImage: value))
            }
            .catch { _ in
                Just(.failure)
            }
            .receive(on: RunLoop.main)
            .assign(to: \.loadingState, on: self)
    }

    private var cancellable: AnyCancellable?
}
