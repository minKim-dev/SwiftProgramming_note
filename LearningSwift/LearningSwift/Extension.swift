//
//  Extension.swift
//  LearningSwift
//
//  Created by 김민성 on 2023/10/11.
//

import Foundation

extension Double {
    
    var squared: Double {
        return self * self
    }
    
    var cubed: Double {
        return self * self * self
    }
}

func test()
{
    let myValue: Double = 3.0
    print(myValue.squared)
}



