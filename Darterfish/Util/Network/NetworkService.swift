//
//  NetworkService.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/19/23.
//

import Foundation
import Alamofire
import AlertKit

struct NetworkService {
    static func get<Res: Codable>(_ url: String, decoder: JSONDecoder = getDecoder()) async throws -> Res? {
        let dataTask = AF.request(url, method: .get).serializingDecodable(Res.self, decoder: decoder)
        let response = await dataTask.response
        if response.error != nil {
            print(response.error!)
            AlertKitAPI.present(
                title: "Something went wrong!",
                icon: .error,
                style: .iOS17AppleMusic,
                haptic: .error
            )
            return nil
        }
        return try await dataTask.value
    }
    
    static func post<Res: Codable, Body: Codable>(_ url: String, body: Body, decoder: JSONDecoder = getDecoder()) async throws -> Res? {
        let dataTask = AF.request(url, method: .post, parameters: body).serializingDecodable(Res.self, decoder: decoder)
        let response = await dataTask.response
        if response.error != nil {
            print(response.error!)
            AlertKitAPI.present(
                title: "Something went wrong!",
                icon: .error,
                style: .iOS17AppleMusic,
                haptic: .error
            )
            return nil
        }
        return try await dataTask.value
    }
    
    static func patch<Res: Codable, Body: Codable>(_ url: String, body: Body, decoder: JSONDecoder = getDecoder()) async throws -> Res? {
        let dataTask = AF.request(url, method: .patch, parameters: body).serializingDecodable(Res.self, decoder: decoder)
        let response = await dataTask.response
        if response.error != nil {
            print(response.error!)
            AlertKitAPI.present(
                title: "Something went wrong!",
                icon: .error,
                style: .iOS17AppleMusic,
                haptic: .error
            )
            return nil
        }
        return try await dataTask.value
    }
    
    static func delete(_ url: String) async throws {
        let dataTask = AF.request(url, method: .delete).serializingData()
        let response = await dataTask.response
        if response.error != nil {
            print(response.error!)
            AlertKitAPI.present(
                title: "Something went wrong!",
                icon: .error,
                style: .iOS17AppleMusic,
                haptic: .error
            )
        }
        return
    }
}
