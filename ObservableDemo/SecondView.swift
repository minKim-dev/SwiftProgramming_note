//
//  SecondView.swift
//  ObservableDemo
//
//  Created by 김민성 on 2023/11/07.
//

import SwiftUI

struct SecondView: View {
    
    @EnvironmentObject var timerData: TimerData
    //ContentView 에서도 그렇고 여기에서도 마찬가지로 자신만의 TimerData 인스턴스를 가진다.
    // 두 뷰에서 동일한 인스턴스를 사용하기 위해서는
    // SecondView로 이동할 때 ContentView에 있는 ObservedObject 객체를 SecondView에 전달해야한다.
    
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
        SecondView().environmentObject(TimerData())
    }
}



