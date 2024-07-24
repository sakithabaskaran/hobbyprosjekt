//
//  Countries.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 24/07/2024.
//

import Foundation

// MARK: - Countries
struct Countries {
    let name: Name
    let tld: [String]?
    let cca2: String
    let ccn3: String?
    let cca3: String
    let independent: Bool?
    let status: Status
    let unMember: Bool
    let currencies: [String: Currency]?
    let idd: Idd
    let capital: [String]?
    let altSpellings: [String]
    let region: Region
    let languages: [String: String]?
    let translations: [String: Translation]
    let latlng: [Double]
    let landlocked: Bool
    let area: Double
    let demonyms: Demonyms?
    let flag: String
    let maps: Maps
    let population: Int
    let car: Car
    let timezones: [String]
    let continents: [Continent]
    let flags: Flags
    let coatOfArms: CoatOfArms
    let startOfWeek: StartOfWeek
    let capitalInfo: CapitalInfo
    let cioc, subregion, fifa: String?
    let borders: [String]?
    let gini: [String: Double]?
    let postalCode: PostalCode?
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
    let latlng: [Double]?
}

// MARK: - Car
struct Car: Codable {
    let signs: [String]?
    let side: Side
}

enum Side: String, Codable {
    case sideLeft
    case sideRight
}

// MARK: - CoatOfArms
struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

enum Continent: Codable {
    case africa
    case antarctica
    case asia
    case europe
    case northAmerica
    case oceania
    case southAmerica
}

// MARK: - Currency
struct Currency: Codable {
    let name, symbol: String
}

// MARK: - Demonyms
struct Demonyms: Codable {
    let eng: Eng
    let fra: Eng?
}

// MARK: - Eng
struct Eng: Codable {
    let f, m: String
}

// MARK: - Flags
struct Flags: Codable {
    let png: String
    let svg: String
    let alt: String?
}

// MARK: - Idd
struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Name: Codable {
    let common, official: String
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String
}

// MARK: - PostalCode
struct PostalCode: Codable {
    let format: String
    let regex: String?
}

enum Region: String, Codable {
    case africa
    case americas
    case antarctic
    case asia
    case europe
    case oceania
}

enum StartOfWeek: String, Codable {
    case monday
    case saturday
    case sunday
}

enum Status: String, Codable {
    case officiallyAssigned
    case userAssigned
}

