//
//  BaseViewModel.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

protocol BaseViewModel {}

protocol PaginationViewModel: BaseViewModel {
    var pageIndex: Int { get }
    var shouldPaginate: Bool {get}
    func nextPage(index: Int)
}
