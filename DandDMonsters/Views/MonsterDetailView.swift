//
//  MonsterDetailView.swift
//  DandDMonsters
//
//  Created by app-kaihatsusha on 11/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct MonsterDetailView: View {
    
    @State var monsterDetailVM = MonsterDetailViewModel()
    @State var monster: Monster
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(monster.name)
                    .font(.largeTitle).bold()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("Type:")
                                .bold()
                            Text(monsterDetailVM.type.capitalized)
                        }
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("Alignment:")
                                .bold()
                            Text(monsterDetailVM.alignment.capitalized)
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("Size:")
                                .bold()
                            Text(monsterDetailVM.size.capitalized)
                        }
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("Hit Points:")
                                .bold()
                            Text("\(monsterDetailVM.hitPoints)")
                        }
                    }
                }
                .font(.title)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .task {
            monsterDetailVM.monsterURL = monster.url
            await monsterDetailVM.getData()
        }
    }
}

#Preview {
    NavigationStack {
        MonsterDetailView(monster: Monster(index: "adult-gold-dragon", name: "Adault Gold Dragon", url: "/api/2014/monsters/adult-gold-dragon"))
    }
}
