//
//  ErrorHandling.swift
//  LearningSwift
//
//  Created by 김민성 on 2023/10/14.
//

/*:
 # 1. Error Handling
 스위프트에서 에러를 처리하는 방법 2가지
 a. iOS 앱의 메서드 내에서 원하는 결과가 나오지 않을 경우에 에러를 발생(throwing)하는 것
 b. 메서드가 던진 에러를 잡아서 처리하는 것
 
 에러를 던질 경우, 특정
 */

/*:
 2. 에러 타입 선언
 원격 서버에 파일을 전송하는 것을 예로 들어보자. 원격 서버에 파일을 전송하는 메서드가 있다고 하면, 이 메서드는 여러 원인으로 인해
 파일 전송에 실패할 수 있다. 이러한 모든 에러는 *Error* 프로토콜을 따르는 *enumeration*에서 표현되도록 할 수 있다.
 */
import Foundation
enum FileTransferError: Error {
    case noConnection
    case lowBandwidth
    case fileNotFound
}

/*:
 3. 에러 던지기
 위에서 에러 타입을 선언했으니, 에러가 발생했을 때 사용해보자!
 메서드나 함수가 에러를 던질 수 있다는 것을 알려줄 때는 *throw* 키워드를 이용한다.
 */
func transferFile1() throws {
    
}

/*:
 결과를 반환하는 메서드나 함수의 경우에는 *throws*키워드를 반환 타입 앞에 적는다.
 */


