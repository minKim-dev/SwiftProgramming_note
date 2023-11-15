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

# 3. @AppStorage property wrapper
## - @AppStorage 프로퍼티 래퍼란?
@AppStorage 프로퍼티 래퍼는 @SceneStorage 프로퍼티 래퍼랑 다르게 앱 전체에서 접근할 수 있는 데이터를 저장하는데 사용되는 프로퍼티 래퍼다.
@SceneStorage에서는 한 화면의 어떤 인스턴스에 저장된 데이터는 앱내의 다른 화면이나 다른 인스턴스에서 접근할 수 없다. 그러나 @AppStorage 프로퍼티 래퍼를 이용하면
앱 전체를 통해서 접근할 수 있는 데이터를 저장할 수 있다.

아래와 같이 @AppStorage 프로퍼티 래퍼를 이용하는데, 키로 사용할 문자열 값을 필요로 한다.
이렇게 해서 만들어진 데이터는 UserDefaults 저장소에 저장되는데 만약, 다른 곳에 저장하고 싶다면 app group을 지정해서 커스텀으로 데이터를 저장할 수 있다.
app group는 그룹 내의 다른 앱 또는 타깃과 데이터를 공유할 수 있게 한다.
```swift
@AppStorage("KEY") var mytext: String = "VALUE"
```
