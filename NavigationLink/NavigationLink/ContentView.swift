//
//  ContentView.swift
//  NavigationLink
//
//  Created by 김민성 on 2024/01/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Your main content
                Text("Main Content")

                // NavigationLink to navigate to the detail view
                NavigationLink(destination: DetailView()) {
                    Text("Go to Detail View")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationBarTitle("Main View")
        }
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail View Content")
            // Add more content for the detail view as needed
        }
        .navigationBarTitle("Detail View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
