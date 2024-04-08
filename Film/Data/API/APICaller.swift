//
//  APICaller.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/5/24.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    private init() {}
    func getMovies(urlString: String, completion: @escaping(([Movie]) -> ())) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            let decoder = JSONDecoder()
            
            do {
                guard let data = data else { return }
                let moviesResponse = try decoder.decode(MovieResponse.self, from: data)
                let listMovie: [Movie] = moviesResponse.results ?? []
                completion(listMovie)
            } catch let error {
                print("Error: \(error)")
                
            }
            
        }.resume()
    }
}
