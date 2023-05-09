//
//  baekjoonApp.swift
//  baekjoon
//
//  Created by 최영우 on 4/5/23.
//

import SwiftUI

@main
struct baekjoonApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: baekjoonDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
