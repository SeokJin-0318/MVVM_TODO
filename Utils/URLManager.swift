//
//  URL.swift
//  MVVM_TODO
//
//  Created by 석진 on 1/29/24.
//

import Foundation


class URLManager 
{
    static let shared = URLManager()
    let url = URL(string: "https://api.thecatapi.com/v1/")!

    private init() { }
    
    func getJsonData(path: String, completion: @escaping (Result<[ImageAPI], Error>) -> Void) 
    {
        let task = URLSession.shared.dataTask(with: url.appending(path: path))
{ data, response, error in
            if let error 
            {
                print("Error: \(error.localizedDescription)")
                completion(.failure(NetworkError.unknown(error.localizedDescription)))
                
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error: invalid response")
                print(data)
                print(error)
                print(response)
                completion(.failure(NetworkError.invalidResponse))
                
                return
            }
            
            guard let data = data else {
                print("Error: no data")
                completion(.failure(NetworkError.emptyResponse))
                
                return
            }
    
            guard let imageAPI = try? JSONDecoder().decode([ImageAPI].self, from: data) else {
                completion(.failure(NetworkError.decodeError))
                
                return
            }

            completion(.success(imageAPI))
        }
        task.resume()
    }
}
