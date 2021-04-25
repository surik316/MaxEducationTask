//
//  ListModel.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 23.04.2021.
//

import Foundation


struct ListNews: Codable {
    let status, copyright: String?
    let num_results: Int?
    let results: [News]
}

struct News: Codable {
    let url: String
    let source, publishedDate: String
    let byline: String
    let title, abstract: String
    let desFacet: [String?]
    let media: [Media]

    enum CodingKeys: String, CodingKey {
        case url, source, byline, title, abstract, media
        case publishedDate = "published_date"
        case desFacet = "des_facet"
    }
    init() {
        self.title = "Some title"
        self.desFacet = ["Some tag"]
        self.url = ""
        self.publishedDate = "2021-06-04"
        self.source = "Some source"
        self.abstract = "Some abstract"
        self.byline = "Some byline"
        self.media = []
    }
}

struct Media: Codable {
    let copyright: String
    let mediaMetadata: [MediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case copyright
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadatum: Codable {
    let url: String
}
