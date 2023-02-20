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
    let lastModified: Date
    let results: [Result]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case lastModified = "last_modified"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
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
}

// MARK: - BookDetail
struct BookDetail: Codable {
    let title, description, contributor, author: String?
    let contributorNote: String?
    let price: Int?
    let ageGroup, publisher, primaryIsbn13: String?
    let primaryIsbn10: Int?

    enum CodingKeys: String, CodingKey {
        case title, description, contributor, author
        case contributorNote = "contributor_note"
        case price
        case ageGroup = "age_group"
        case publisher
        case primaryIsbn13 = "primary_isbn13"
        case primaryIsbn10 = "primary_isbn10"
    }
}

// MARK: - Isbn
struct Isbn: Codable {
    let isbn10: Int?
    let isbn13: String?
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
}

enum BookList: Int, CaseIterable {
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
