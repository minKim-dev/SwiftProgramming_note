# How to use Custom Type
summary
`@AppStorage`와 `@SceneStorage` 프로퍼티 래퍼는 특정 타입의 값만을 저장하도록 허용한다. 만약 다른 타입을 저장하고 싶다면, 해야한다면 어떻게 해야할까? 이것에 대한 답을 우리는 알아본다. 

``` Swift
// 구조체를 선언하고
struct UserName {
    var firstName: String
    var secondName: Stirng
}

// 초기화한 모습이다.
var username = UserName(firstName: "Mark", secondName: "Wilson")
```
위에서 UserName은 앱 또는 화면 기반 저장소에 저장하려 할 때 지원하는 타입이 아니기에 직접 저장할 수 없다. 이를 해결하기 위해서는 Data 인스턴스로 인코딩하고 캡슐화를 하면 된다. 저장은 Data 객체로 인코딩하고 가져올 때 디코딩하여 가져온다.
인코딩과 디코딩을 수행하는 과정은 데이터의 타입에 따라서 다른데 가장 중요한 점은 해당 타입이 `Encodable`과 `Decodable` 프로토콜을 지켜야한다는 것이다.
``` Swift
struct UserName: Encodable, Decodable {
    var firstName: String 
    var secondName: Stirng
```

아래의 코드는 JSON 인코더를 이용해서 username 인스턴스를 인코딩하고 @AppStorage 프로퍼티 래퍼를 사용해서 저장하는 모습이다.
``` Swift
@AppStorage("username") var namestore: Data = Data()
.
.
// JSON encoding
let encoder = JSONEncoer()

if let data. = try? encoder.encode(username) {
    namestore = data
}

// JSON decoding
let decoder = JSONDecoder()

if let name = try? decoder.decode(UserName.self, from: namestore) {
    username = name
}
```
이와 같이 인코딩, 디코딩 기술을 이용하면 아래와 같이 이미지를 저장할 수도 있다.
``` Swift
@AppStorage("myimage") var imagestore: Data = Data()

var image = UIImage(named: "profilephoto")

// 인코딩 및 이미지 저장

if let data = image!.pngData() {
    imagestore = data
}

// 이미지 가져와서 디코딩

if let decodedImage: UIImage = UIImage(data: imagestore) {
    image = decodedImage
}
```

# JSON encoder and decoder
