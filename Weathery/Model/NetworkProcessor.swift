//
//  NetworkProcessor.swift
//  Weathery
//
//  Created by GUIEEN on 5/14/19.
//  Copyright © 2019 GUIEEN. All rights reserved.
//

import Foundation

class NetworkProcessor
{
    // lazy :: Dont initialize & Dont create these properties out of the class until I use it.
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    // URLSession: related classes provied an API for downloading content.
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    
    let url: URL
    
    init(url: URL)
    {
        self.url = url
    }
    
    // JSON
    typealias JSONDictionaryHandler = (([String: Any]?) -> Void)
    
    func downloadJSONFromURL(_ completion: @escaping JSONDictionaryHandler)
    {
        let request = URLRequest(url: self.url)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil {
                
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200:
                        // successful response
                        if let data = data {
                            print(data)
                            
                            do {
                                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                                
                                completion(jsonDictionary as? [String : Any])
                                
                            } catch let error as NSError {
                                print("Error processing json data: \(error.localizedDescription)")
                            }
                            
                            
                        }
                    
                    default:
                        print("HTTP Response Code: \(httpResponse.statusCode)")
                    }
                }
                
            } else {
                print("ERROR: \(error?.localizedDescription)")
            }
        }
        
        dataTask.resume()
    }
    
}






















