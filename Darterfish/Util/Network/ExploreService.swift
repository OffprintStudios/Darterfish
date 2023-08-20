//
//  ExploreService.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation
import AlertKit
import Alamofire

func getNewsPosts(page: Int = 1, per: Int = 6) async throws -> Paginate<Blog>? {
    return try await NetworkService.get("https://api.offprint.net/news/fetch-posts?page=\(page)&per=\(per)")
}

func getNewWorks(page: Int = 1, per: Int = 6) async throws -> Paginate<Work>? {
    return try await NetworkService.get("https://api.offprint.net/explore/new-works?page=\(page)&per=\(per)")
}

func getRecentlyUpdated(page: Int = 1, per: Int = 6) async throws -> Paginate<Work>? {
    return try await NetworkService.get("https://api.offprint.net/explore/updated-works?page=\(page)&per=\(per)")
}

func getGenres() async throws -> [Tag.FetchTag]? {
    return try await NetworkService.get("https://api.offprint.net/explore/genres")
}
