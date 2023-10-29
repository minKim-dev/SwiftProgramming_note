//
//  Observable:State:Environment object.swift
//  LearningSwift
//
//  Created by 김민성 on 2023/10/27.
//

/*:
 # 참고하자!
 여기에서는 *SwiftStateProperty.swift* 파일에서 다뤘던 상태 프로퍼티말고
 Observable, State, Environment 객체에 대해서 알아본다.
 */

/*:
 # A. Observable object
 자! Observable 객체라는 것이 무엇이냐...
 우리가 앞서 공부한 상태 프로퍼티는 뷰의 상태를 저장할 수 있는 방법이었다.
 이 상태 프로퍼티는 해당 뷰에서만 사용할 수 있었고 그 외의 메인 뷰와 분리된 하위 뷰에서 사용하고 싶을 경우에는
 @Binding 프로퍼티 래퍼를 이용해서 State 바인딩을 구현해야했다.
 그리고 상태 프로퍼티는 일시적이라 부모 뷰가 사라지면 그 상태가 사라진다.
 Observable 객체는 여러 다른 뷰들이 외부에서 접근할 수 있는 지속적인 데이터를 표현하는데 사용된다.
 */

/*:
 ## 1. publisher와 subscriber
 드디어 publisher와 subscriber에 대한 내용이 등장한다.
 Observable 객체가 작동하는 원리는 다음과 같다. Observable 객체는 게시된 프로퍼티(published property)로서 값을 게시(publish)한다.
 그런 다음, Observer 객체가 게시자를 구독(subscirbe)하여 게시된 프로퍼티가 변경될 때 마다 알림을 받는다.
 Observable 객체의 게시된 프로퍼티를 구현할 때는 @Publishd 프로퍼티 래퍼를 이용한다.
 Combine 프레임워크는 이러한 구독자와 게시자의 관계를 쉽게 구현할 수 있게 해준다.
 */
import SwiftUI
import Foundation
import Combine

class DemoData: ObservableObject {
    @Published var userCount = 0
    @Published var currentUser = 0
    
    init() {
        // 데이터를 초기화하기 위한 코드
        updateData()
    }
    
    func updateData() {
        // 데이터를 최신 상태로 유지하기 위한 코드가 여기에 온다.
    }
}

struct Observable_Object: View {
    
    @ObservedObject var demoData : DemoData = DemoData() // 객체를 구독하기 위해서는 @ObservedObject 프로퍼티 래퍼를 이용한다.
    
    var body: some View {
        Text("\(demoData.currentUser), you are user number \(demoData.userCount)")
    }
}

struct Observable_State_Environment_object_Previews: PreviewProvider {
    static var previews: some View {
        Observable_Object(demoData: DemoData())
    }
}

/*:
 # B. State object
 ## 1. State object가 뭘까?
 @StateObject의 차이는 @ObservedObject의 대안이다. @ObservedObject는 객체를 **참조**한다. 즉, 객체를 선언한 뷰가 소유하지 않기 때문에
 사용되는 동안에 SwiftUI에 의해서 파괴되거나 다시 생성될 위험이 있다. @StateObject는 사용하게 되면 참조를 선언한 뷰가 참조를 **소유**하기 때문에
 해당 참조가 선언된 로컬 뷰나 자식 뷰에 의해 계속해서 필요로 하는 동안에는 SwiftUI에 의해 파괴되지 않는다.
 */

/*:
 # C. Environment object
 ## 1. Environment object 란 뭘까?
 구독되는 객체의 특정은 앱 내의 몇몇의 SwiftUi 뷰에서 사용된다는 것이다.
 하지만 만약에 어떤 뷰에서 다른 뷰로 navigate될 때에도 동일한 구독 객체에 접근해야 한다면?
 하나의 SwiftUI 뷰에서의 다른 하위 뷰들이 계층적 구조를 이루고 그 안에서 동일한 구독 객체에 접근할 때와 이 문제는 다른 문제라고 할 수 있다.
 환경자체가 바뀌어 버리는 것, 즉 아예 다른 뷰로 이동해버리는 것이기 때문이다. 그래서 프로퍼티 래퍼의 이름이 Environment인 것 같다...
 어쨌든! 이런 경우에는 이동할 때 다른 뷰로 구독되는 객체에 대한 참조를 전달해 줘야한다.
 */
