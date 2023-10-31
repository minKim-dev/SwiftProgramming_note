//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by 김민성 on 2023/10/31.
//
// SwiftUI 활용 예제

import SwiftUI

struct ContentView: View {
    
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex: Int = 0
    @State private var rotation: Double = 0
    @State private var text: String = "welcome to Swift"
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text(text)
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                    .rotationEffect(.degrees(rotation)) // rotation 값을 참조만 하는 거라서 $을 쓰지 않음.
                    .animation(.easeInOut(duration: 5), value: rotation)
                    .foregroundColor(colors[colorIndex])
                Spacer()
                Divider()
                
                Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                    .padding()
                
                TextField("Enter text here", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Picker(selection: $colorIndex, label: Text("Color")) {
                    ForEach(0 ..< colornames.count, id:\.self) {
                        Text(colornames[$0])
                            .foregroundColor(colors[$0])
                    }
                  
                }
                .pickerStyle(.wheel)
                .padding()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
