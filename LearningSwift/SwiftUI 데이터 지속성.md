# SwiftUI 데이터 지속성
@AppStorage와 @SceneStorage 프로퍼티 래퍼를 이용한 SwiftUI의 데이터 지속성에 대해서 공부한다.

## Overview
SwiftUI 데이터 지속성을 위해서 @SceneStorage, @AppStorage 프로퍼티 래퍼를 이용한다. @SceneStorage 프로퍼티 래퍼는 개별 앱 화면 인스턴스의 범위 내에서 소량의 데이터를 저장하는데 사용되며, 앱이 실행되는 사이에 화면 상태를 저장하고 복원하는데 이상적이다. 그러나 한 화면에 저장된 데이터는 앱 내의 다른 화면에서 접근할 수 없다. (동일한 화면에서 다른 인스턴스라도 안됨.) 반면, @AppStorage 프로퍼티 래퍼는 앱 전체를 통해서 데이터에 접근할 수 있다. 따라서 @AppStorage 프로퍼티 래퍼는 앱 전체를 통하여 접근하고 사용할 수 있는 데이터를 저장하는데 사용한다. 
이 외에도 StorageDemo 프로젝트를 통해 SwiftUI의 데이터 지속성에 대해서 공부한다.


## Topics

### 1. 앱의 데이터 지속성이란?
- SwiftUI의 데이터 지속성

### 2. @SceneStorage property wrapper
- @SceneStorage 프로퍼티 래퍼란?

### 3. @AppStorage property wrapper
- @AppStorage 프로퍼티 래퍼란?

### 4. StorageDemo 프로젝트를 통한 두 프로퍼티 래퍼의 사용 예시 확인
- 프로젝트 링크
vvv
