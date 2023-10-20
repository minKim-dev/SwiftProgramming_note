//
//  GeneratingCustomView.swift
//  LearningSwift
//
//  Created by 김민성 on 2023/10/19.
//

/*:
 # 1. 스위프트에서 View는 어떠한 의미를 가지는가?
 스위프트에서 뷰는 View 프로토콜을 따르는 구조체로 선언된다.
 View 프로토콜을 따른다는 것은 무엇을 의미하는걸까?
 View 프로토콜을 따른다는 것은 구조체 안에 body 프로퍼티를 가지고 있어야 한다는 의미이고
 이 body프로퍼티 안에 뷰가 선언되어야 한다는 의미이다.
 
 # 2. 커스텀 뷰의 구조
 커스텀 뷰는 여러 개의 자식 뷰로 이루어져 있고 이를 캡슐화한 뷰가 커스텀 뷰이다.
 (참고로 뷰는 앱의 하나의 화면이 아니라 텍스트 레이블, 텍스트 필드. 메뉴, 토글, 레이아웃과 같은 것을 말한다.)
 이제 한 번 이 커스텀 뷰를 Swift UI를 이용해서 만들어 보도록 하자!
 */

import SwiftUI

struct GeneratingCustomView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world")
        }
        Text("Goodbye, world!") // Text 뷰를 추가했다.
    }
}

struct GeneratingCustomView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratingCustomView()
    }
}

/*:
 # 3. 스위프트UI 뷰의 계층적 구조
 스위프트UI 뷰는 기본적으로 부모 뷰와 자식 뷰 형태의 계층 구조(hierarchy structure)가 된다.
 애플은 최대한 뷰를 작고 가볍게 하라고 권장한다. 이 말의 의미가 무엇이냐 하면 재사용할 수 있는 컴포넌트 생성을 권장하고
 뷰 선언부를 더 쉽게 관리하도록 하며, 레이아웃이 더 효율적으로 랜더링되도록 한다.
 */

struct ContentView1: View {
    var body: some View {
        VStack {
            VStack {
                Text("Text1")
                Text("Text2")
                MyHStackView()
            }
            Text("Text5")
        }
    }
}

struct MyHStackView: View {
    var body: some View {
        HStack {
            Text("Text3")
            Text("Text4")
        }
    }
}

/*:
 # 4. 프로퍼티로서의 뷰
 하위 뷰를 생성하는 외에도 프로퍼티를 뷰에 할당해서 복잡한 뷰 계층을 구성할 수도 있다.
 */
struct ContentView2: View {
    var body: some View {
        VStack {
            Text("Main Title")
                .font(.largeTitle)
            HStack {
                Text("Car Image")
                Image(systemName: "car.fill")
            }
        }
    }
}

// ContentView2를 프로퍼티를 이용해서 바꿔보자
struct ViewAsProperty: View {
    
    let carStack = HStack {
        Text("Car Image")
        Image(systemName: "car.fill")
    }
    
    var body: some View {
        VStack {
            Text("Main Title")
                .font(.largeTitle)
            carStack
        }
    }
}

/*:
 # 5. modifier를 이용해서 뷰 변경하기
 */

// Text의 폰트와 배경 색상을 설정해보자
// Text("Text 1")
//     .font(.headline)
//     .foregroundColor(.red)

// Image 사이즈 조절하기
// Image(systemName: "car.fill")
//      .resizable()
//      .aspectRatio(contentMode: .fit)

// 아래와 같은 경우는 앞서 선언했던 MyHStackView 커스텀 뷰의 Text 뷰들의 폰트를 largeTitle 폰트 스타일로 변경한다.
// MyStackView()
//      .font(.largeTitle)

/*:
 수정자들을 연결할 때 수정자의 순서가 중요하다는 것을 알아야한다.
 */

// 첫 번째의 경우, 텍스트 뷰에 먼저 경계선을 그리고 padding에 의해 여백을 추가하게 되고
// 두 번째의 경우, 텍스트 뷰에 먼저 여백을 추가하고 경계선을 그리게 된다.
//Text("Sample Text")
//    .border(Color.black)
//    .padding()
//
//Text("Sample Text")
//    .padding()
//    .border(Color.black)

/*:
 우리는 커스텀 수정자라는 것을 이용해서 뷰에 자주 적용되는 대표적인 수정자들을 만들 수 있게 된다.
 */

// 다음과 같이 4개의 수정자를 한 묶음으로 자주 사용한다고 하면,
Text("Text 1")
    .font(.largeTitle)
    .background(Color.white)
// 이 4개의 수정자를 계속 적용하는 것보다 이걸 묶어서 필요할 때마다 참조한다면 좋을 것이다.

