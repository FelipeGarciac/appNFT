//
//  GenericService.swift
//  AppBackFront
//
//  Created by Felipe Garcia on 06/11/23.
//

import Foundation
import Alamofire

enum Error: Swift.Error {
    case filenNotFound(name: String)
    case fileDecodingFalied(name: String, Swift.Error)
    case errorRequest(AFError)
}
protocol GernericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}
