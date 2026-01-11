//
//  MonsterDetailViewModel.swift
//  DandDMonsters
//
//  Created by app-kaihatsusha on 11/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//
// "https://www.dnd5eapi.co" + "/api/2014/monsters/adult-gold-dragon"

import Foundation

@Observable
class MonsterDetailViewModel {
    
    var name: String = ""
    var size: String = ""
    var type: String = ""
    var alignment: String = ""
    var hitPoints: Int = 0
    var imageURL: String? = ""
    
    var urlString = ""
    var isLoading = false
    let baseURL = "https://www.dnd5eapi.co"
    var monsterURL = ""
    
    func getData() async {
        
        urlString = baseURL+monsterURL
        
        isLoading = true
        print("🕸️ We are accessing the url \(urlString)")
        // Create URL
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            isLoading = false
            return
        }
        
        do {
            // if issues in simulator to get data...
            // let configuration = URLSessionConfiguration.ephemeral
            // let session = URLSession(configuration: configuration)
            // let (data, _) = try await session.data(from: url)
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode JSON into data structure
            guard let returned = try? JSONDecoder().decode(MonsterDetail.self, from: data) else {
                print("😡 JSON ERROR: Could not decode returned JSON data")
                isLoading = false
                return
            }
            
            // Confirm data was decoded:
            print("😎 JSON returned! name: \(returned.name)")
            Task { @MainActor in
                self.name = returned.name
                self.size = returned.size
                self.type = returned.type
                self.alignment = returned.alignment
                self.hitPoints = returned.hit_points
                self.imageURL = self.baseURL + (returned.image ?? "")
                isLoading = false
            }
        } catch {
            isLoading = false
            print("😡 ERROR: Could not get data from \(urlString) \(error.localizedDescription)")
        }
    }
    
}
