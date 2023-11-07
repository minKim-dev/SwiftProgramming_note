//
//  FirstTabView.swift
//  LifecycleDemo
//
//  Created by 김민성 on 2023/11/07.
//

import SwiftUI

struct FirstTabView: View {
    
    var body: some View {
        
        Text("View One")
            .onAppear(perform: {
                print("on Appear triggered")
            })
            .onDisappear(perform: {
                print("onDisappeared triggered")
            })
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}
