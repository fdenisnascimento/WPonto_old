//
//  User.swift
//  WPonto
//
//  Created by Denis Nascimento on 01/07/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import WatchKit

class User: NSObject {
    
    
    //MARK: Public methods
    class  func signup(email: String, password: String, completion: @escaping (_ userID: String? )->())  {
        let userData =  ["email": email,"password": password]
        
        FirebaseManager.post(url: User().signupUrl(), params: userData) { result in
            if let dic = result {
                completion(dic["localId"] as? String)
            }else{
                completion(nil)
            }
        }
        
    }
    
    
    class func signin(email: String, password: String, completion: @escaping (_ userID: String?) -> ()) {
        
        let userData =  ["email": email,"password": password]
        
        FirebaseManager.post(url: User().signinUrl(), params: userData) { (result) in
            if let dic = result {
                completion(dic["localId"] as? String)
            }else{
                completion(nil)
            }
        }
        
    }
    
    
    //MARK: Private methods
    
    private func signupUrl() -> String {
        return "https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=" + FirebaseManager().hashKey()
    }
    
    private func signinUrl() -> String {
        return "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=" + FirebaseManager().hashKey()
    }
    
    
}
