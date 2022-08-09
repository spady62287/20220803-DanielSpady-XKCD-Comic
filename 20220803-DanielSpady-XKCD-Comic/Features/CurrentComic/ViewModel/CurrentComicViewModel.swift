//
//  CurrentComicViewModel.swift
//  20220803-DanielSpady-XKCD-Comic
//
//  Created by Daniel Spady on 2022-08-03.
//

import SwiftUI
import Combine

class CurrentComicViewModel: ObservableObject {
    @Published var currentComic: CurrentComicResult?
    
    var cancellable = Set<AnyCancellable>()
    
    func fetchCurrentComic() {
        let request = CurrentComicRequest()
        if let url = request.url {
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { output in
                    guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                        throw ComicRequestError.statusCode
                    }
                    return output.data
                }
                .decode(type: CurrentComicResult.self, decoder: JSONDecoder())
                .retry(3)
                .eraseToAnyPublisher()
                .receive(on: DispatchQueue.main)
                 .sink { completion in
                     print("-----> completion: \(completion)")
                 } receiveValue: { currentComic in
                     self.currentComic = currentComic
                 }
                .store(in: &self.cancellable)
        }
    }
}

enum ComicRequestError: Error {
    case statusCode
}
