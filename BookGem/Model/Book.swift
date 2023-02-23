//
//  Book.swift
//  BookGem
//
//  Created by саргашкаева on 20.02.2023.
//

import Foundation


struct BookModel: Codable {
    let status, copyright: String
    let numResults: Int?
    let lastModified: String
    let results: [Book]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case lastModified = "last_modified"
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(String.self, forKey: .status)
        self.copyright = try container.decode(String.self, forKey: .copyright)
        self.numResults = try container.decodeIfPresent(Int.self, forKey: .numResults)
        self.lastModified = try container.decode(String.self, forKey: .lastModified)
        self.results = try container.decodeIfPresent([Book].self, forKey: .results)
    }
}

// MARK: - Result
struct Book: Codable {
    let listName, displayName, bestsellersDate, publishedDate: String?
    let rank, rankLastWeek, weeksOnList, asterisk: Int?
    let dagger: Int?
    let amazonProductURL: String?
    let isbns: [Isbn]?
    let bookDetails: [BookDetail]?
    let reviews: [Review]?

    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case displayName = "display_name"
        case bestsellersDate = "bestsellers_date"
        case publishedDate = "published_date"
        case rank
        case rankLastWeek = "rank_last_week"
        case weeksOnList = "weeks_on_list"
        case asterisk, dagger
        case amazonProductURL = "amazon_product_url"
        case isbns
        case bookDetails = "book_details"
        case reviews
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.listName = try container.decodeIfPresent(String.self, forKey: .listName)
        self.displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        self.bestsellersDate = try container.decodeIfPresent(String.self, forKey: .bestsellersDate)
        self.publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate)
        self.rank = try container.decodeIfPresent(Int.self, forKey: .rank)
        self.rankLastWeek = try container.decodeIfPresent(Int.self, forKey: .rankLastWeek)
        self.weeksOnList = try container.decodeIfPresent(Int.self, forKey: .weeksOnList)
        self.asterisk = try container.decodeIfPresent(Int.self, forKey: .asterisk)
        self.dagger = try container.decodeIfPresent(Int.self, forKey: .dagger)
        self.amazonProductURL = try container.decodeIfPresent(String.self, forKey: .amazonProductURL)
        self.isbns = try container.decodeIfPresent([Isbn].self, forKey: .isbns)
        self.bookDetails = try container.decodeIfPresent([BookDetail].self, forKey: .bookDetails)
        self.reviews = try container.decodeIfPresent([Review].self, forKey: .reviews)
    }
}

// MARK: - BookDetail
struct BookDetail: Codable {
    let title, description, contributor, author: String?
    let contributorNote: String?
    let price: String?
    let ageGroup, publisher, primaryIsbn13: String?
    let primaryIsbn10: String?

    enum CodingKeys: String, CodingKey {
        case title, description, contributor, author
        case contributorNote = "contributor_note"
        case price
        case ageGroup = "age_group"
        case publisher
        case primaryIsbn13 = "primary_isbn13"
        case primaryIsbn10 = "primary_isbn10"
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
        self.primaryIsbn13 = try container.decodeIfPresent(String.self, forKey: .primaryIsbn13)
        self.primaryIsbn10 = try container.decodeIfPresent(String.self, forKey: .primaryIsbn10)
    }
}

// MARK: - Isbn
struct Isbn: Codable {
    let isbn10: String?
    let isbn13: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isbn10 = try container.decodeIfPresent(String.self, forKey: .isbn10)
        self.isbn13 = try container.decodeIfPresent(String.self, forKey: .isbn13)
    }
}

// MARK: - Review
struct Review: Codable {
    let bookReviewLink, firstChapterLink, sundayReviewLink, articleChapterLink: String?

    enum CodingKeys: String, CodingKey {
        case bookReviewLink = "book_review_link"
        case firstChapterLink = "first_chapter_link"
        case sundayReviewLink = "sunday_review_link"
        case articleChapterLink = "article_chapter_link"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bookReviewLink = try container.decodeIfPresent(String.self, forKey: .bookReviewLink)
        self.firstChapterLink = try container.decodeIfPresent(String.self, forKey: .firstChapterLink)
        self.sundayReviewLink = try container.decodeIfPresent(String.self, forKey: .sundayReviewLink)
        self.articleChapterLink = try container.decodeIfPresent(String.self, forKey: .articleChapterLink)
    }
}

enum BookList: CaseIterable {
    
    case Manga
    case YoungAdult
    case Science
    case Business
    case Education
    
    var encodedName: String {
        switch self {
        case .Manga:
            return "manga"
        case .YoungAdult:
            return "young-adult"
        case .Science:
            return "science"
        case .Business:
            return "business"
        case .Education:
            return "education"
        }
    }
    
    var name: String {
        switch self {
        case .Manga:
            return "Manga"
        case .YoungAdult:
            return "Young Adult"
        case .Science:
            return "Science"
        case .Business:
            return "Business"
        case .Education:
            return "Education"
        }
    }
}
