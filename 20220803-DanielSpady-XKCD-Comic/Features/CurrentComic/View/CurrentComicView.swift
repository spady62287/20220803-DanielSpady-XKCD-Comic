//
//  CurrentComicView.swift
//  20220803-DanielSpady-XKCD-Comic
//
//  Created by Daniel Spady on 2022-08-03.
//

import Combine
import SwiftUI

struct CurrentComicView: View {
    var body: some View {
        NavigationView {
            VStack {
                if let currentComic = viewModel.currentComic {
                    if let url = URL(string: currentComic.img ?? "") {
                        // Can Be replaced with AsyncImage in iOS 15
                        LoadedView(url: url)
                    }
                    if let title = currentComic.title {
                        AnimatedText(text: title)
                    }
                }
            }
            .navigationTitle("XKCD Comic")
            .onAppear {
                viewModel.fetchCurrentComic()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Comic Description"), message: Text(viewModel.currentComic?.alt ?? ""), dismissButton: .default(Text("OK")))
            }
            .onTapGesture {
                self.showingAlert.toggle()
            }
        }
    }
    @ObservedObject var viewModel = CurrentComicViewModel()
    @State private var showingAlert = false
}
