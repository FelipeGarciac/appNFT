//
//  HomeService.swift
//  AppBackFront
//
//  Created by Felipe Garcia on 06/11/23.
//

import UIKit
import Alamofire

protocol HomeServiceDelegate: GernericService {
    func getHomeFromJson(completion: @escaping completion<NFTData?>)
    func getHome(completion: @escaping completion<NFTData?>)
}

class HomeService: HomeServiceDelegate{
    
    func getHome(completion: @escaping completion<NFTData?>) {
        let url: String = "https://run.mocky.io/v3/e143f50f-3561-46fb-872a-44b0df33075a"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of:NFTData.self) { response  in
            debugPrint(response)
            switch response.result {
            case .success(let success):
                print("Sucsses -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("Error -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    
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
