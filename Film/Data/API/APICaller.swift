//
//  APICaller.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/5/24.
//

import Foundation
import UIKit

class APICaller {
    static let shared = APICaller()
    let cache = NSCache<NSString, UIImage>()
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
    
    func getMovieDetail(id: Int, completion: @escaping ((Movie) -> Void)) {
        
        let urlString = Urls.shared.getMovieDetailUrl(id: id)
        print("----\(urlString)")
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            let decoder = JSONDecoder()
            
            do {
                guard let data = data else { return }
                let movieDetail = try decoder.decode(Movie.self, from: data)
                completion(movieDetail)
            } catch let error {
                print("Error:\(error)")
            }
        }.resume()
    }
    
    func getActorDetail(id: Int, completion: @escaping ((Actor) -> Void?)) {
        let urlString = Urls.shared.getActorDetailUrl(id: id)
        print("-------\(urlString)")
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
        let decoder = JSONDecoder()
            do {
                guard let data = data else { return }
                let actorDetail = try decoder.decode(Actor.self, from: data)
                completion(actorDetail)
            } catch let error {
                print("Error:\(error)")
            }
        }.resume()
        
    }
    
    func searchMovie(query: String, page: Int, completion: @escaping (([Movie]) -> ())) {
        let urlString = Urls.shared.getSearchUrl(query: query, page: page)
        print("------\(urlString)")
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
    
    func downloadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self,
                  error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        task.resume()
    }
}
