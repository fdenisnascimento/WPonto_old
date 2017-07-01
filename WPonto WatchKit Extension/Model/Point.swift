//
//  Point.swift
//  WPonto
//
//  Created by Denis Nascimento on 01/07/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import WatchKit

class Point: NSObject {
    
    
    
    
    //MARK: Public methods
    class func register( completion: @escaping (_ name: String? )-> ()) {
        
        let pointData = ["hour": Date().friendlyHours()]
        
        FirebaseManager.post(url: Point().registerUrl(), params: pointData) { (result) in
            if let dic = result {
                completion(dic["name"] as? String)
            }else{
                completion(nil)
            }
        }
    }
    
    
    //    class func retrieveAllPointsFromUser(userId: String, completion: @escaping (_ []))
    
    //MARK: Public private
    
    func registerUrl() -> String {
        
        let date = Date().friendlyDate()
        let userId = FirebaseManager().userID()
        return "https://wponto-e1f31.firebaseio.com/user-points/\(userId)/\(date).json"
    }
    
    
}
