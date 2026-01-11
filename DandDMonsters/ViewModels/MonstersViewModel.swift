//
//  MonstersViewModel.swift
//  DandDMonsters
//
//  Created by app-kaihatsusha on 11/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import Foundation

@Observable
class MonstersViewModel {
    
    private struct Returned: Codable {
        var count: Int
        var results: [Monster]
    }
    
    var count = 0
    var monsters: [Monster] = []
    var urlString = "https://www.dnd5eapi.co/api/2014/monsters"
    
    func getData() async {
        
//        urlString = "https://www.dnd5eapi.co/api/2014/"+monster
        
        print("🕸️ We are accessing the url \(urlString)")
        // Create URL
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode JSON into data structure
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                
                print("😡 JSON ERROR: Could not decode returned JSON data")
                return
            }
            
            // Confirm data was decoded:
            print("😎 JSON returned! count: \(returned.count)")
            Task { @MainActor in
                self.count = returned.count
                self.monsters = returned.results
            }
        } catch {
            print("😡 ERROR: Could not get data from \(urlString)")
        }
    }
}
