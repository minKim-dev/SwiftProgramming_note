//
//  SwiftStateProperty.swift
//  LearningSwift
//
//  Created by 김민성 on 2023/10/22.
//
import SwiftUI
/*:
 # 1. SwiftUI 상태 프로퍼티, observable, state, environment 객체
 사용자 인터페이스 내의 뷰들은 기본 데이터의 변경에 따른 처리 코드를 작성하지 않아도 뷰가 업데이트 된다.
 이는 사용자 인터페이스 내부의 뷰 사이에 publisher와 subscriber를 구축하여 할 수 있다.
 이러한 구축을 위해서 SwiftUI는 상태 프로퍼티 Observable 객체, State 객체, Environment 객체를 제공한다.
 이 파트를 공부할 때는 이들에 대한 설명과 언제 사용해야하는 지에 대해서 배웠고
 이 객체들에 대한 자세한 부분은 뒤 챕터에서 볼 수 있다.
 */

/*:
 # 2. publisher와 subscriber, 이 둘 도대체 뭘까?
 일단 이 챕터를 보면 알 수 있을 것 같아서 다 보고 정리하도록 하겠다.
 */

/*:
 # 3. 상태 프로퍼티
 상태에 대한 가장 기본적인 프로퍼티이다. 상태? 상당히 포괄적인 용어인데
 여기에서의 상태는 뷰 레이아웃의 현재상태, 예를 들어 토글버튼이 활성화 되었는지 여부, 텍스트 필드에 입력된 텍스트, 피커 뷰에서의 현재 선택을 말한다.
 상태 프로퍼티는 이러한 상태를 저장하기 위해서만 이용된다.
 상태 프로퍼티는 String이나 Int값과 같은 간단한 데이터 타입을 저장하기 위해 사용되고, @State 프로퍼티 래퍼를 이용하여 선언된다.
 */
struct SwiftStateProperty: View {
    @State private var wifiEnabled = true
    @State private var userName = ""
    
    var body: some View {
        VStack {
            Text("blah blah")
        }
    }
}
/*:
 ## a. 바인딩하기
 만약에 상태 프로퍼티 값이 변경되었다면, 그건 그 프로퍼티에 의존하는 모든 뷰는 어떤 식으로든 최신 값이 반영되도록 업데이트 된다.
 상태 프로퍼티를 선언하면 레이아웃에 있는 뷰와 바인딩이라는 것을 할 수 있다. 이런 바인딩을 통해서 바인딩이 되어있는 뷰에서 어떤 변경이 일어나면
 해당 상태 프로퍼티에 자동으로 반영할 수 있게 한다.
 아래에서 처럼 TextField 뷰는 사용자가 입력한 텍스트를 저장하는데 사용하기 위해서 userName이라는 상태 프로퍼티랑 바인딩이 되어 있는 모습을 볼 수 있다.
 사용자가 TextField에 입력하게 되면 바인딩은 그 입력된 텍스트를 userName 프로퍼티에 저장하게 된다. 그리고 이 상태 프로퍼티가 변할 때 마다 뷰의 계층 구조가 다시 랜더링 된다.
 */
struct StatePropertyBinding1: View {
    @State private var wifiEnabled = true
    @State private var userName = ""
    
    var body: some View {
        VStack {
            TextField("Enter user name", text: $userName)
            Text(userName) // 입력된 사용자의 이름이 바인딩에 의해 반영되는 것을 직접 확인할 수 있다!
        }
    }
}

// 책에 나왔던 Toggle뷰와 wifiEnabled 상태 프로퍼티 간의 바인딩
struct StatePropertyBinding2: View {
    @State private var wifiEnabled = true
    @State private var userName = ""
    
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnabled) {
                Text("Enable Wi-Fi")
            }
            TextField("Enter user name", text: $userName)
            Text(userName)
            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash") // 삼항연산자
        }
    }
}

/*:
 ## b. State 바인딩
 만약에 아래와 같은 상황이면 어떻게 해야할까?
 즉, 어떤 뷰가 하나 이상의 하위 뷰를 가지고 있으면서 동일한 상태 프로퍼티에 대해 접근해야 하는 경우가 발생하는 경우말이다.
 아래는 WifiImageView가 하위 뷰로 분리되어 있는 상황인데 이 뷰는 여전히 wifiEnable 상태 프로퍼티에 접근해야한다.
 하지만 Image뷰는 분리된 하위 뷰의 요소이기 때문에 메인 뷰의 범위에서 벗어나게 된다. 이 말이 무엇이냐 하면...
 WifiImageView의 입장에서 WifiImageView에 있는 wifiEnabled 프로퍼티는 저장되지 않은 것이다.
 메인 뷰에는 wifiEnabled가 있지만 하위 뷰로써 독립한(분리된)우리의 WifiImageView는 아무 것도 없는 상황이기 때문이다.(선언된 프로퍼티가 없음)
 따라서 Image 뷰에서 wifiEnabled라는 녀석을 쓰면 "잉...? 나 이런 녀석 모르는데?" 이런 식으로 되는 것이지...!
 그럼 이런 문제를 어떻게 해결하냐고? 다음과 같이 @Binding 프로퍼티 래퍼를 이용해서 프로퍼티를 선언한다면 이 문제는 쉽게 해결할 수 있다!!
 */
struct StateBinding: View {
    
    @State private var wifiEnabled = true
    @State private var userName = ""
    
    var body: some View {
        
        VStack {
            Toggle(isOn: $wifiEnabled) {
                Text("Enable Wi-Fi")
            }
            TextField("Enter user name", text: $userName)
            WifiImageView(wifiEnabled: $wifiEnabled)
        }
    }
}
    
    struct WifiImageView: View {
        
        @Binding var wifiEnabled : Bool
        
        var body: some View {
            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash") // 에러가 발생한다.
        }
    }



//struct SwiftStateProperty_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftStateProperty1()
//    }
//}
//: [Next Topic](@Observable:State:Environment.swift)

