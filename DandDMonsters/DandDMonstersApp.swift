//
//  DandDMonstersApp.swift
//  DandDMonsters
//
//  Created by app-kaihatsusha on 10/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

@main
struct DandDMonstersApp: App {
    var body: some Scene {
        WindowGroup {
            MonstersListView()
//                .onAppear {
//                    Thread.sleep(forTimeInterval: 3.0)
//                }
        }
    }
}
