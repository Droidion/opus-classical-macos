//
//  Models.swift
//  opus classical desktop
//
//  Created by Denis Rodionov on 6.8.2023.
//

import Foundation

struct Period : Decodable {
    let id: Int
    let name: String
    let yearStart: Int
    let yearEnd: Int?
    let slug: String
    let composers: [Composer]
}

struct Composer : Decodable {
    let id: Int
    let firstName: String
    let lastName: String
    let yearBorn: Int
    let yearDied: Int?
    let slug: String
    let wikipediaLink: String?
    let imslpLink: String?
    let enabled: Bool?
    let countries: String
}

func fetchPeriods() async throws -> [Period] {
    let url = URL(string: "https://opusclassical.net/api/periods")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let decoded = try JSONDecoder().decode([Period].self, from: data)
    return decoded
}
