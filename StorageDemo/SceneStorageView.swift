//
//  SceneStorageView.swift
//  StorageDemo
//
//  Created by 김민성 on 2023/11/15.
//

import SwiftUI

struct SceneStorageView: View {
    // 화면 저장소를 실행하지 않았을 코드를 실행하고 화면에 아무 텍스트를 입력한 다음 중지시키고 다시 실행하면 적었던 내용이 사라져있을 것 이다.
    // 이 문제를 해결하기 위해서는 화면 저장소를 사용하면 된다!
    
    // 기존의 코드: @State private var editorText: String = "Hello"
    // 아래의 경우에는 중지하고 다시 실행시켜도 내가 적어놓은 글이 남아있다!
    @SceneStorage("mytext") private var editorText: String = ""
    
    // 아이패드에서 스플릿 뷰를 통해서 두 개의 창을 띄우고 서로 다른 텍스트를 입력 후, 종료후 다시 실행 시키면 두 개의 화면에 동일한 텍스트가 아닌 다르게 적었던 그대로 저장되어있다.
    // 이것이 의미하는 바는 각 화면에는 각 화면만의 저장된 데이터 복사본이 있다는 것으로 볼 수 있다.
    var body: some View {
        // TextEditor는 여러 줄의 텍스트를 표시하고 편집할 수 있도록 설계된 뷰다.(대표적으로, 메모장 만들 때 쓰이겠군...!)
        TextEditor(text: $editorText) // editorText라는 상태 프로퍼티에 대한 바인딩이 되어있는 모습이다!
            .padding(30)
            .font(.largeTitle) 
        
    }
}

struct SceneStorageView_Previews: PreviewProvider {
    static var previews: some View {
        SceneStorageView()
    }
}
