//
//  FirebaseManager.swift
//  WPonto
//
//  Created by Denis Nascimento on 29/06/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import WatchKit

class FirebaseManager: NSObject {
    
    func hashKey() -> String {
        return "AIzaSyAU529BWj9GoRZJdjto3GgQPNq23gbDCjI"
    }
    
    func signupUrl() -> String {
        return "https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=" + hashKey()
    }
    
    func signup(email: String, password: String, completion: @escaping (_ userID: String? )->())  {
        let userData =  ["email": email,"password": password]
        
        post(url: signupUrl(), params: userData) { result in
            if let dic = result {
                completion(dic["localId"] as? String)
            }else{
                completion(nil)
            }
        }
        
    }
    
    
    func post(url : String,params : Dictionary<String, String>, completion: @escaping (_ result: Dictionary<String, Any>?)->()) {
        
        let jsonData = try? JSONSerialization.data(withJSONObject: params)
        
        
        let url = URL(string: url)!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
        
        
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
    }
    
}
