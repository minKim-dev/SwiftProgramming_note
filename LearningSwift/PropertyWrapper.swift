//
//  PropertyWrapper.swift
//  LearningSwift
//
//  Created by 김민성 on 2023/10/11.
//

import Foundation

struct Address {
    private var cityname: String
    
    var city: String {
        get {cityname}
        set{cityname = newValue.uppercased()}
    }
}

var address = Address()

address.city = "London"
print(address.city)


