//
//  Subclassing.swift
//  LearningSwift
//
//  Created by 김민성 on 2023/10/11.
//
//: # example of Subclassing //

import Foundation

// 계좌 번호와 잔고를 저장하는 클래스
class BankAccount {
    
    var accountBalance: Float
    var accountNumber: Int
    
    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalance = balance
    }
    
    func displayBalance() {
        print("Number \(accountNumber)")
        print("Current Balance is \(accountBalance)")
    }
}

// 우리에게 계좌 번호와 잔고를 저장하는 클래스 외에
// 저축 계좌로 사용할 클래스가 필요하다고 한다면...?
// 저축 계좌도 똑같이 계좌번호와 잔고를 저장해야 하고, 그 데이터에 접근할 수 있는 메서드도 필요할 것이다.
// 이 때 우리는 Subclassing을 이용해서 이 데이터와 메소드를 BankAccount 클래스로 부터 복사해
// 새로운 클래스를 만들고 저축 계좌에 필요한 새로운 기능을 넣는다!
class SavingsAccount: BankAccount {
    
    var interestRate: Float = 0.0
    
    init(number: Int, balance: Float, rate: Float)
    {
        interestRate = rate
        super.init(number: number, balance: balance)
    }
    
    func calculateInterest() -> Float
    {
        return interestRate * accountBalance
    }
    // -> calculateInterest 메소드를 봤다면 main.swift로 돌아가 override에 대해 보고 오자!
    
    override func displayBalance()
    {
        print("Number \(accountNumber)")
        print("Current Balance is \(accountBalance)")
        print("Prevailing interest rate is \(interestRate)")
        
    /* 하위 클래스에서 오버라이드된 상위 클래스의 메서드를 호출해서 다음과 같이 표현할 수도 있다.(코드의 중복을 없앨 수 있음!)
     override func displayBalance()
     {
        super.displayBalance()
        print("Prevailing interest rate is \(interestRate)")
     }
    */
    }
}

let savings1 = SavingsAccount(number: 12311, balance: 600.00, rate: 0.07)
print(savings1.calculateInterest())
print(savings1.displayBalance())


