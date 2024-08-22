// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
// let countriesJSON = try Countries(json)

import Foundation

// MARK: - Countries
struct Countries: Decodable, Identifiable {
    var id: UUID = UUID()
    let name: Name
    let tld: [String]
    let cca2: String
    let ccn3: String
    let cca3: String
    let independent: Bool
    let status: Status
    let unMember: Bool
    let currencies: [String: Currency]?
    let idd: Idd
    let capital: [String]
    let altSpellings: [String]
    let region: Region
    let languages: [String: String]
    let translations: [String: Translation]
    let latlng: [Double]
    let landlocked: Bool
    let area: Double
    let demonyms: Demonyms
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
struct CapitalInfo: Decodable {
    let latlng: [Double]
}

// MARK: - Car
struct Car: Decodable {
    let signs: [String]
    let side: Side
}

enum Side: String, Decodable {
    case left
    case right
}

// MARK: - CoatOfArms
struct CoatOfArms: Decodable {
    let png: String
    let svg: String
}

enum Continent: String, Decodable {
    case africa
    case antarctica
    case asia
    case europe
    case northAmerica
    case oceania
    case southAmerica
}

// MARK: - Currency
struct Currency: Decodable {
    let name, symbol: String
}

// MARK: - Demonyms
struct Demonyms: Decodable {
    let eng: Eng
    let fra: Eng?
}

// MARK: - Eng
struct Eng: Decodable {
    let f, m: String
}

// MARK: - Flags
struct Flags: Decodable {
    let png: String
    let svg: String
    let alt: String?
}

// MARK: - Idd
struct Idd: Decodable {
    let root: String
    let suffixes: [String]
}

// MARK: - Maps
struct Maps: Decodable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Name: Decodable {
    let common, official: String
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Decodable {
    let official, common: String
}

// MARK: - PostalCode
struct PostalCode: Decodable {
    let format: String
    let regex: String?
}

enum Region: String, Decodable {
    case africa
    case americas
    case antarctic
    case asia
    case europe
    case oceania
}

enum StartOfWeek: String, Decodable {
    case monday
    case saturday
    case sunday
}

enum Status: String, Decodable {
    case officiallyAssigned
    case userAssigned
}
