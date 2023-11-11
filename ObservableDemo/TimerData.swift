//
//  TimerData.swift
//  ObservableDemo
//
//  Created by 김민성 on 2023/11/07.
//

import Foundation
import Combine

class TimerData : ObservableObject { // ObservableObject 프로토콜을 구현하는 함수로 선언
    
    @Published var timeCount = 0 
    var timer : Timer?
    
    init() {
        // 매초에 timerDidFire() 함수를 호출하는 Timer 인스턴스
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerDidFire),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
}
