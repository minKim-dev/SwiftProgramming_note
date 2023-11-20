//
//  AppStorageView.swift
//  StorageDemo
//
//  Created by 김민성 on 2023/11/15.
//

import SwiftUI

struct AppStorageView: View {
    
    @AppStorage("mytext") var editorText: String = "Sample Text"
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

struct AppStorageView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageView()
    }
}
