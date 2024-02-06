//
//  NetworkService.swift
//  iMusic
//
//  Created by nik on 18.01.2024.
//

import UIKit
import Alamofire

class NetworkService {
    func fetchTracks(searchText: String, completion: @escaping (SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search"
        let searchParameters = ["term":"\(searchText)",
                                "limit":"10",
                                "media":"music"]
        
        AF.request(url, parameters: searchParameters).response { response in
            if let error = response.error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = response.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                completion(objects)
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion(nil)
            }
        }
    }
}
