//
//  FirebaseManager.swift
//  WPonto
//
//  Created by Denis Nascimento on 29/06/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import WatchKit

class FirebaseManager: NSObject {
    
    
    //MARK: Public methods
    
    
    class func get(url : String, completion: @escaping (_ result: Dictionary<String, Any>?)->()) {
        
        let taskGet = URLSession.shared.dataTask(with: URL(string: url)!) { (data, request, error) in
            if error == nil {
                if let result = data {
                    do{
                        if  let json =  try JSONSerialization.jsonObject(with: result, options: []) as? Dictionary<String, Any> {
                            completion(json)
                        }
                        
                    }catch{
                        completion(nil)
                    }
                }
            }else{
                completion(nil)
            }
  
        }
        taskGet.resume()
        
    }

    
    class func post(url : String,params : Dictionary<String, String>, completion: @escaping (_ result: Dictionary<String, Any>?)->()) {
        
        
        if let request = FirebaseManager().request(url: url, params: params) {
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if error == nil {
                    if let result = data {
                        do{
                            if  let json =  try JSONSerialization.jsonObject(with: result, options: []) as? Dictionary<String, Any> {
                                completion(json)
                            }
                            
                        }catch{
                            completion(nil)
                        }
                    }
                }else{
                    completion(nil)
                }
            }
            task.resume()
            
        }else{
            debugPrint("invalid request")
            completion(nil)
        }
        
        
    }
    
    
    //MARK: Private methods
    
    func userID() -> String {
        return "TieGre2MuHeIN9HHpsk8tIMc7oj2"
    }
    
    func hashKey() -> String {
        return "AIzaSyAU529BWj9GoRZJdjto3GgQPNq23gbDCjI"
    }
    
    private func request(url: String, params : Dictionary<String, String>)-> URLRequest! {
        
        let url = URL(string: url)!
        let jsonData = try? JSONSerialization.data(withJSONObject: params)
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
        
        return request
    }
    
    
    
}
