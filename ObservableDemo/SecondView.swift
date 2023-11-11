//
//  SecondView.swift
//  ObservableDemo
//
//  Created by 김민성 on 2023/11/07.
//

import SwiftUI

struct SecondView: View {
    
    @StateObject var timerData: TimerData
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
        }
        .padding()
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(timerData: TimerData())
    }
}



