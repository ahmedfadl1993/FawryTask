//
//  BaseRequest.swift
//  Enjoy
//
//  Created by Kirollos Maged on 3/31/20.
//  Copyright © 2020 Kirollos Maged. All rights reserved.
//

import Foundation
import Alamofire

public protocol BaseRequestProtocol {
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var parameters: Parameters? { get }
}

extension BaseRequestProtocol {
    var method: HTTPMethod { return .get }
    var headers: HTTPHeaders { return [:] }
    var parameters: Parameters? { return [:] }
}

/// Use this BaseRequest to create basic get request with only custom URL
class BaseRequest: BaseRequestProtocol {
    var url: String

    required init(url: String) {
        self.url = url
    }
}

public protocol MultipartRequestProtocol: BaseRequestProtocol {
    typealias MultipartAttachment = (fileName: String, url: URL)
    var attachments: [MultipartAttachment] { get }
}
