//
//  File.swift
//  Netflix Clone
//
//  Created by Jim Yang on 2023-08-08.
//

import Foundation

struct Constants{
    static let API_KEY = ""
    static let API_TOKEN = "Bearer "
    static let baseURL = "https://api.themoviedb.org"
    
    static let YoutubeAPI_KEY = ""
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error{
    case failedToGetData
}

class APICaller{
    static let shared = APICaller()
    let headers = [
        "accept": "application/json",
        "Authorization": Constants.API_TOKEN
    ]

    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>)->Void){
        
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/trending/movie/day?language=en-US")! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                
                guard let data = data else{
                    return
                }
                do{
                                    
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.results))
                } catch {
                    completion(.failure(APIError.failedToGetData))
                    
                }
            }
        })
        
        dataTask.resume()
        
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>)->Void){
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/trending/tv/day?language=en-US")! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                
                guard let data = data else{
                    return
                }
                do{
                                    
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                    let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    completion(.success(results.results))
//                    print(results)
                } catch {
                    completion(.failure(APIError.failedToGetData))
                    
                }
            }
        })
        
        dataTask.resume()

    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>)->Void){
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/movie/upcoming?language=en-US&page=1")! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                
                guard let data = data else{
                    return
                }
                do{
                                    
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                    let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    completion(.success(results.results))
//                    print(results)
                } catch {
                    completion(.failure(APIError.failedToGetData))
                    
                }
            }
        })
        
        dataTask.resume()

    }

    func getPopular(completion: @escaping (Result<[Title], Error>)->Void){
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/tv/popular?language=en-US&page=1")! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                
                guard let data = data else{
                    return
                }
                do{
                                    
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                    let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    completion(.success(results.results))
//                    print(results)
                } catch {
                    completion(.failure(APIError.failedToGetData))
                    
                }
            }
        })
        
        dataTask.resume()

    }

    func getTopRated(completion: @escaping (Result<[Title], Error>)->Void){
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/tv/top_rated?language=en-US&page=1")! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                
                guard let data = data else{
                    return
                }
                do{
                                    
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                    let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    completion(.success(results.results))
//                    print(results)
                } catch {
                    completion(.failure(APIError.failedToGetData))
                    
                }
            }
        })
        
        dataTask.resume()

    }

    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>)->Void){
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc")! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                
                guard let data = data else{
                    return
                }
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                    let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    completion(.success(results.results))
//                    print(results)
                } catch {
                    completion(.failure(APIError.failedToGetData))
                    
                }
            }
        })
        
        dataTask.resume()

    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>)->Void){
       guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/search/movie?query=\(query)")! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
//        let dataTask = session.dataTask(with: URLRequest(url: url)){ (data, _, error) in
        let dataTask = session.dataTask(with: request as URLRequest){ (data, _, error) in

        if (error != nil) {
                print(error as Any)
            } else {
                guard let data = data else{
                    return
                }
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                    let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    completion(.success(results.results))
                } catch {
                    completion(.failure(APIError.failedToGetData))
                    
                }
            }
        }
        
        dataTask.resume()

    }
    
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>)->Void){
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.YoutubeBaseURL)/q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {return}
        
        let task=URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error==nil else{
                return
            }
            
            do {
                let results =  try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
            }catch{
                completion(.failure(error))
                print(error.localizedDescription)
                
            }
        }
        
        task.resume()

    }
    
    
}
