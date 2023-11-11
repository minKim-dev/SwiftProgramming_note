//
//  ContentView.swift
//  ObservableDemo
//
//  Created by 김민성 on 2023/11/07.
//

import SwiftUI

struct ContentView: View {
    
    // @ObservedObject의 단점을 보완하기 위해 @StateObject 사용
    // @StateObject를 사용했기 때문에 참조를 선언한 뷰가 참조를 소유한다.
    // 따라서 참조가 선언된 로컬 뷰나 자식 뷰에 의해 계속 필요로 하는 동안에는 SwiftUI에 의해 파괴되지 않음.
    @StateObject var timerData: TimerData = TimerData()
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: resetCount) { // 왜 따로 body 밖에 resetCount() 함수를 호출하는 함수를 만든걸까?
                    Text("Reset Counter")
                }
                
                // 내비게이션을 추가했다.
                // 이건 두 개의 뷰가 동일한 Observable 객체 인스턴스를 구독하고 있음을 알 수 있다.
                NavigationLink(destination: SecondView(timerData: timerData)) {
                    Text("Next Screen")
                }
                .padding()
            }
        }
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
