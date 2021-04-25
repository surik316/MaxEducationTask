//
//  ListModel.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 23.04.2021.
//

import Foundation

// MARK: - Welcome
struct ListNews: Codable {
    let status, copyright: String?
    let num_results: Int?
    let results: [News]
}

// MARK: - Result
struct News: Codable {
    let url: String
    let source, publishedDate, updated, section: String
    let subsection, nytdsection, adxKeywords, byline: String
    let title, abstract: String
    let desFacet: [String?]
    let media: [Media]

    enum CodingKeys: String, CodingKey {
        case url
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, title, abstract
        case desFacet = "des_facet"
        case media
    }
    init() {
        self.title = "Some title"
        self.desFacet = ["Some tag"]
        self.url = ""
        self.publishedDate = "2021-06-04"
        self.source = "Some source"
        self.updated = "Some Updated"
        self.section = "Some Section"
        self.subsection = "Some Subsection"
        self.abstract = "Some abstract"
        self.nytdsection = "Some nytdsection"
        self.adxKeywords = "Some keywords"
        self.byline = "Some byline"
        self.media = []
    }
}

// MARK: - Media
struct Media: Codable {
    let copyright: String
    let mediaMetadata: [MediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case copyright
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String
}
