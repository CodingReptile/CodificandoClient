//
//  NetworkHelper.swift
//  CodificandoClient
//
//  Created by Juan Ochoa on 8/6/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import Foundation

public class NetworkHelper
{
    public static func GetListOfServerGames(execute: @escaping ([GameDescription]) -> Void)
    {
        let gameListEndpoint : String = Configuration.GameListUrl

        guard let url = URL(string: gameListEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)

        let session = URLSession.shared

        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in

            // check for any errors
            guard error == nil else {
                print(error!)
                return
            }

            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }

            let decoder = JSONDecoder()
            guard let serverGames = try? decoder.decode([GameDescription].self, from: responseData) else
            {
                print("error trying to convert data to JSON")
                return
            }

            DispatchQueue.main.async {
                execute(serverGames)
            }
        }
        task.resume()
    }
}
