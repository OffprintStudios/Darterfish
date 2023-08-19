//
//  ExploreService.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation
import AlertKit

func getNewsPosts() async throws -> Paginate<Blog>? {
    guard let url = URL(string: "https://api.offprint.net/news/fetch-posts?page=1&per=6") else {
        AlertKitAPI.present(
            title: "Invalid URL for news posts",
            icon: .error,
            style: .iOS17AppleMusic,
            haptic: .error
        )
        return nil
    }
    
    let urlRequest = URLRequest(url: url)
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    
    guard (response as? HTTPURLResponse)?.statusCode == 200 else {
        AlertKitAPI.present(
            title: "Invalid response for news posts",
            icon: .error,
            style: .iOS17AppleMusic,
            haptic: .error
        )
        return nil
    }
    
    let blogs = try getDecoder().decode(Paginate<Blog>.self, from: data)
    return blogs
}
