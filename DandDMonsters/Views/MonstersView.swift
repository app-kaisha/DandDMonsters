//
//  MonstersView.swift
//  DandDMonsters
//
//  Created by app-kaihatsusha on 10/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct MonstersView: View {
    
    @State private var monstersVM = MonstersViewModel()
    
    var body: some View {
        LazyVStack {
            Text("Monsters")
            Text("\(monstersVM.count)")
            Text("\(monstersVM.monsters.first?.name ?? "")")
            
        }
        .padding()
        .task {
            await monstersVM.getData()
        }
    }
}

#Preview {
    MonstersView()
}
