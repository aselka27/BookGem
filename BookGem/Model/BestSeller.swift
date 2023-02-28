//
//  BestSeller.swift
//  BookGem
//
//  Created by саргашкаева on 27.02.2023.
//

import Foundation

struct BestSellerModel: Codable {
    let status, copyright: String?
    let numResults: Int?
    let results: [BestSellerInfo]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.numResults = try container.decodeIfPresent(Int.self, forKey: .numResults)
        self.results = try container.decodeIfPresent([BestSellerInfo].self, forKey: .results)
    }
}

// MARK: - Result
struct BestSellerInfo: Codable {
    let title, description, contributor, author: String?
    let contributorNote: String?
    let price: String?
    let ageGroup, publisher: String?
    let isbns: [Isbn]?
    let ranksHistory: [RanksHistory]?
    let reviews: [Review]?

    enum CodingKeys: String, CodingKey {
        case title, description, contributor, author
        case contributorNote = "contributor_note"
        case price
        case ageGroup = "age_group"
        case publisher, isbns
        case ranksHistory = "ranks_history"
        case reviews
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.contributor = try container.decodeIfPresent(String.self, forKey: .contributor)
        self.author = try container.decodeIfPresent(String.self, forKey: .author)
        self.contributorNote = try container.decodeIfPresent(String.self, forKey: .contributorNote)
        self.price = try container.decodeIfPresent(String.self, forKey: .price)
        self.ageGroup = try container.decodeIfPresent(String.self, forKey: .ageGroup)
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.isbns = try container.decodeIfPresent([Isbn].self, forKey: .isbns)
        self.ranksHistory = try container.decodeIfPresent([RanksHistory].self, forKey: .ranksHistory)
        self.reviews = try container.decodeIfPresent([Review].self, forKey: .reviews)
    }
}

// MARK: - RanksHistory
struct RanksHistory: Codable {
    let primaryIsbn10, primaryIsbn13: String?
    let rank: Int?
    let listName, displayName, publishedDate, bestsellersDate: String?
    let weeksOnList: Int?
    let ranksLastWeek: Int?
    let asterisk, dagger: Int?

    enum CodingKeys: String, CodingKey {
        case primaryIsbn10 = "primary_isbn10"
        case primaryIsbn13 = "primary_isbn13"
        case rank
        case listName = "list_name"
        case displayName = "display_name"
        case publishedDate = "published_date"
        case bestsellersDate = "bestsellers_date"
        case weeksOnList = "weeks_on_list"
        case ranksLastWeek = "ranks_last_week"
        case asterisk, dagger
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.primaryIsbn10 = try container.decodeIfPresent(String.self, forKey: .primaryIsbn10)
        self.primaryIsbn13 = try container.decodeIfPresent(String.self, forKey: .primaryIsbn13)
        self.rank = try container.decodeIfPresent(Int.self, forKey: .rank)
        self.listName = try container.decodeIfPresent(String.self, forKey: .listName)
        self.displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        self.publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate)
        self.bestsellersDate = try container.decodeIfPresent(String.self, forKey: .bestsellersDate)
        self.weeksOnList = try container.decodeIfPresent(Int.self, forKey: .weeksOnList)
        self.ranksLastWeek = try container.decodeIfPresent(Int.self, forKey: .ranksLastWeek)
        self.asterisk = try container.decodeIfPresent(Int.self, forKey: .asterisk)
        self.dagger = try container.decodeIfPresent(Int.self, forKey: .dagger)
    }
}

