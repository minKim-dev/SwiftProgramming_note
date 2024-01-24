//
//  ContentView.swift
//  NavigateOtherView
//
//  Created by 김민성 on 2024/01/20.
//
// 버튼을 이용한 Navigation(페이지 전환) 구현하기 (NavigationView를 이용한 Navigation 구현)

import SwiftUI



struct ContentView: View {
    
    @State private var isDetailViewActive = false
    // @State private var isMainViewActive = false

        var body: some View {
            NavigationView { 
                VStack {
                    // Your main content
                    Text("Main Content")

                    // Button to navigate to the detail view
                    Button("Go to Detail View") {
                        isDetailViewActive.toggle()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .sheet(isPresented: $isDetailViewActive) { // 화면이 뜨는 방식
                        // This is the DetailView that will be presented
                        DetailView(isDetailViewActive: $isDetailViewActive)
                    }
                }
                .navigationBarTitle("Main View")
            }
        }
}

struct DetailView: View {
    @Binding var isDetailViewActive: Bool
    // @Binding var isMainViewActive: Bool
    
    var body: some View {
        VStack {
            Text("Detail View Content")
            // Add more content for the detail view as needed
            Button("Go to Main View") {
               isDetailViewActive.toggle()
                //isMainViewActive.toggle()
                
            }
            
        }
        .navigationBarTitle("Detail View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
