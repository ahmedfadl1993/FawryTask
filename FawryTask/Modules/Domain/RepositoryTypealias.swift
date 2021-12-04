//
//  RepositoryTypealias.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

typealias Failure = (_ errorMessage: String) -> Void
typealias Success = () -> Void

typealias NewsCompletion = (_ news: [NewsModel]) -> Void
