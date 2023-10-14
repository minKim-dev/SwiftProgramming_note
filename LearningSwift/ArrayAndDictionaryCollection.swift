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
    불변형으로 만들고 싶다면 *let* 키워드를 사용하면 됨.
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
    하나의 배열에 들어있는 원소의 개수는 *count* 프로퍼티에 접근해서 알아낸다.
    추가적으로 *Bool* 타입인 *isEmpty* 프로퍼티를 이용하면 배열이 비었는지 알 수 있음.
    */
let treeArray3 = ["Pine", "Oak", "Yew"]
var itemCount = treeArray3.count

//print(itemCount)

/*:
    # 4. 배열 항목 섞기, 무작위로 가져오기
    *shuffled()* 메서드를 호출하면 항목의 순서가 무작위로 섞인 새로운 배열이 반환된다.
    배열의 항목을 무작위로 선택하고 싶다면 *randomElement()* 메서드를 호출하면 된다.
    */
let suffledTrees = treeArray1.shuffled()
let randomTree = treeArray2.randomElement()

/*:
    # 5. 배열에 항목 추가하기
    *append* 메서드나 +, += 연산자를 이용하여 배열에 항목을 추가할 수 있음.
    */
//treeArray1.append("Redwood")
//treeArray1 += ["Redwood"]
//treeArray1 += ["Redwood", "Maple", "Birch"] // 뭐 당연 하겠지만... 여러개 추가 가능하다!

/*:
    # 6. 항목 삽입과 삭제
    *insert(at:)* 메서드를 호출해서 특정 인덱스 위치에 삽입할 수 있다.
    새로운 항목이 삽입되는 인덱스 위치를 포함하여 그 뒤에 있던 항목들은 오른쪽으로 한 칸씩 이동함.
    *remove(at:)* 메서드를 호출하여 특정 인덱스에 있는 배열의 항목 제거 가능.
    배열의 마지막 항목을 삭제하려면 *removeLast* 메서드 사용.
    */
//treeArray1.insert("Maple", at: 0)
//treeArray1.remove(at: 2)
//treeArray1.removeLast()

/*:
    # 7. 배열 반복하기
    배열을 반목하는 방법은 *for-in* 반복문을 이용하는 것과
    *forEach()* 배열 메소드를 호출하는 방법이 있다.
    */

// for-in 반복문 이용
let treeArray4 = ["Pine", "Oak", "Yew", "Maple", "Birch", "Myrtle"]

//for tree in treeArray4 {
//  print(tree)
//}
    
// forEach() 배열 메소드 호출
//treeArray4.forEach { tree in
//    print(tree)
//}
//
//treeArray4.forEach { tree in
//    print($0)
//}

/*:
    # 8. 타입이 혼합된 배열 생성하기
    타입이 혼합된 배열이라는 것은 서로 다른 클래스 타입의 항목들을 담을 수 있는 배열이다.
    스위프트에서는 Any 타입이 있는데, 이는  지정된 클래스 타입이 아닌 객체를 참조하는데 사용된다.
    Any 객체 타입을 포함하도록 선언된 배열은 여러 타입의 항목을 담을 수 있게 된다.
 */
let mixedArray1: [Any] = ["A String", 432, 34.989]

// 형 변환에 유의해야 하는 경우
let mixedArray2: [Any] = [1, 2, 45, "Hello"]

// 배열의 요소를 다운캐스팅 한다.
// 이러면 배열의 마지막인 String 요소에 다다랐을 때, 에러메시지와 함께 충돌이 발생함.
//for object in mixedArray2 {
//    print(object as! Int * 10)
//}






