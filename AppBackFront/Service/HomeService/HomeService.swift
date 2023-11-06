//
//  HomeService.swift
//  AppBackFront
//
//  Created by Felipe Garcia on 06/11/23.
//

import UIKit

protocol HomeServiceDelegate: GernericService {
    func getHomeFromJson(completion: @escaping completion<NFTData?>)
}

class HomeService: HomeServiceDelegate {
    
    func getHomeFromJson(completion: @escaping completion<NFTData?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let nftData: NFTData = try JSONDecoder().decode(NFTData.self, from: data)
                completion(nftData,nil)
            } catch {
                completion(nil, Error.fileDecodingFalied(name: "HomeData", error))
            }
            
            
        } else {
            completion(nil, Error.filenNotFound(name: "HomeData"))
        }
    }
}
