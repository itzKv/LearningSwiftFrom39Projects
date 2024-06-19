//
//  ContentView.swift
//  Project1_StormViewer
//
//  Created by Kevin Brivio on 19/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var pictures: [String] = []
    var body: some View {
        VStack {
            if pictures.isEmpty {
                Text("Error: Could not load images.")
            } else {
                List(pictures, id: \.self) { picture in
                    Text(picture)
                }
            }
        }
        // We can't use if, let, or for, inside the view body.
        .onAppear {
            if let resourcePath = Bundle.main.resourcePath {
                do {
                    let items = try FileManager.default.contentsOfDirectory(atPath: resourcePath)
                    pictures = items.filter { $0.hasPrefix("nssl") }
                } catch {
                    // Handle the error if needed
                    print("Error loading images: \(error.localizedDescription)")
                }
            } else {
                print("Error: Resource path not found.")
            }
        }
    }
}

#Preview {
    ContentView()
}
