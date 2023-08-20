//
//  ExploreService.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation
import AlertKit
import Alamofire

func getNewsPosts() async throws -> Paginate<Blog>? {
    return try await NetworkService.get("https://api.offprint.net/news/fetch-posts?page=1&per=6")
}
