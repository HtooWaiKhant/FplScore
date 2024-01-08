//
//  APICaller.swift
//  Fpl
//
//  Created by Htoo Wai Khant on 27/12/2566 BE.
//

import Foundation


enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getPlayerScores(completionHandler: @escaping (_ result: Result<PlayerModel, NetworkError>) -> Void) {
        
        let urlString = NetworkConstants.shared.serverAddress +
                "player/scores?position=3"
                
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse {
                print(String(data: data, encoding: .utf8) ?? "Data is not valid UTF-8")
                do {
                    let resultData = try JSONDecoder().decode(PlayerModel.self, from: data)
                    completionHandler(.success(resultData))
                } catch {
                    print(error.localizedDescription)
                    completionHandler(.failure(.canNotParseData))
                }
            } else {
                print(err?.localizedDescription ?? "Unknown error")
                completionHandler(.failure(.canNotParseData))
            }

        }.resume()
    }
}
