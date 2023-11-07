//
//  ContentView.swift
//  LifecycleDemo
//
//  Created by 김민성 on 2023/11/07.
//
// 앱의 생명주기와 관련된 여러 수정자를 살펴본다.

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FirstTabView()
                .tabItem {
                    Image(systemName: "01.circle")
                    Text("First")
                }
            
            SecondTabView()
                .tabItem {
                    Image(systemName: "02.circle")
                    Text("Second")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
