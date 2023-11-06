//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Felipe Garcia on 06/11/23.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject{
    func success()
    func error()
}

class HomeViewModel {
    
    private let service: HomeService = HomeService()
    private var nftData: NFTData?
    weak private var delegate: HomeViewModelDelegate?
    
    
    public func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: typeFetch) {
        switch typeFetch {
        case .mock:
            service.getHomeFromJson { result, faliure in
                if let result {
                    self.nftData = result
                    self.delegate?.success()
                } else {
                    print(faliure as Any)
                    self.delegate?.error()
                }
            }
        case .request:
            service.getHome { result, faliure in
                if let result {
                    self.nftData = result
                    self.delegate?.success()
                } else {
                    print(faliure as Any)
                    self.delegate?.error()
                }
            }
        }
    }
}
