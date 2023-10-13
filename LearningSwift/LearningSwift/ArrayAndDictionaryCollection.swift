//
//  ArrayAndDictionaryCollection.swift
//  LearningSwift
//
//  Created by 김민성 on 2023/10/14.
//

/*:
 # 1. 스위프트에서의 Collection
 스위프트에서의 Collection은 가변형과 불변형으로 나뉨.
 가변형으로 만들고 싶다면 컬렉션을 저장할 때 var 키워드를 사용하고,
 불변형으로 만들고 싶다면 let 키워드를 사용하면 됨.
 */

/*:
 # 2. 스취프트 배열 초기화
 배열의 타입에서 타입 어노테이션을 사용해서 구체적으로 지정할 수도,
 타입 추론을 이용해서 컴파일러가 식별하게 할 수도 있다.
 */

var treeArray1 = ["Pine", "Oak", "Yew"] // 가변형
let treeArray2 = ["Pine", "Oak", "Yew"] // 불변형

var priceArray = [Float]()

var nameArray = [String](repeating: "My String", count: 10)

/*:
 # 3. count, isEmpty 프로퍼티
 하나의 배열에 들어있는 원소의 개수는 count 프로퍼티에 접근해서 알아낸다.
 추가적으로 Bool 타입인 isEmpty 프로퍼티를 이용하면 배열이 비었는지 알 수 있음.
 */
let treeArray3 = ["Pine", "Oak", "Yew"]
var itemCount = treeArray3.count

//print(itemCount)

/*:
 # 4. 배열 항목 섞기, 무작위로 가져오기
 */

