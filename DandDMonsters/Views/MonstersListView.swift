//
//  MonstersListView.swift
//  DandDMonsters
//
//  Created by app-kaihatsusha on 10/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct MonstersListView: View {
    
    @State private var monstersVM = MonstersViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                List(monstersVM.monsters) { monster in
                    NavigationLink {
                        // TODO: add link view
                    } label: {
                        Text(monster.name)
                            .font(.title2)
                    }
                }
                .listStyle(.plain)
                
                if monstersVM.isLoading {
                    ProgressView()
                        .tint(.red)
                        .scaleEffect(4)
                }
            }
            .navigationTitle("Monsters:")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Text("\(monstersVM.count) Monsters")
                }
            }
        }
        .task {
            await monstersVM.getData()
        }
    }
}

#Preview {
    NavigationStack {
        MonstersListView()
    }
}
