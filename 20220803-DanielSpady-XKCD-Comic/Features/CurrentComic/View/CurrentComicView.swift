//
//  CurrentComicView.swift
//  20220803-DanielSpady-XKCD-Comic
//
//  Created by Daniel Spady on 2022-08-03.
//

import Foundation
import Combine
import SwiftUI
import Dispatch

struct CurrentComicView: View {
    var body: some View {
        NavigationView {
            VStack {
                if let currentComic = viewModel.currentComic {
                    if let url = URL(string: currentComic.img ?? "") {
                        // Can Be replaced with AsyncImage in iOS 15
                        LoadedView(url: url)
                            .frame(width: 320.0, height: 320.0)
                    }
                    if let title = currentComic.title {
                        Text(title)
                            .font(Font.system(size: 96, weight: .regular, design: .monospaced))
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .foregroundColor(.blue)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .animation(.easeInOut)
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
