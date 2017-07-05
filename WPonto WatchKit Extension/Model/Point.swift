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
    class func register( completion: @escaping (_ created: Bool )-> ()) {
        
        let pointData = ["hour": Date().friendlyHours()]
        
        FirebaseManager.post(url: Point().registerUrl(), params: pointData) { (result) in
            if result != nil {
                completion(true)
            }else{
                completion(false)
            }
        }
    }
    
    
    class func retrieveAllPointsFromUser( completion: @escaping (_ result: Dictionary<String, Any>?)->()) {
        
        let userId = FirebaseManager().userID()
        let url = String(format: "https://wponto-e1f31.firebaseio.com/user-points/%@.json",userId)
        debugPrint("url:\(url)")
        
        FirebaseManager.get(url: url) { (result) in
            if let dic = result {
                completion(dic)
            }else{
                completion(nil)
            }
        }
        
    }
    
    class func retrieveLastMonthPointsFromUser(completion: @escaping (_ result: Dictionary<String, Any>?)->()) {
        
        let userId = FirebaseManager().userID()
        let year = Date().year()
        let month = Date().month()
        
        let url = String(format: "https://wponto-e1f31.firebaseio.com/user-points/%@/%@/%@.json",userId, year, month)
        debugPrint("url:\(url)")
        
        FirebaseManager.get(url: url) { (result) in
            if let json = result {
                
                completion(json)
            }else{
                completion(nil)
            }
        }
        
    }
    
    class func retrieveYearPointsFromUser(year: Int, completion: @escaping (_ result: Dictionary<String, Any>?)->()) {
        
        let userId = FirebaseManager().userID()
        let url = String(format: "https://wponto-e1f31.firebaseio.com/user-points/%@/%@.json",userId, String(year))
        debugPrint("url:\(url)")
        
        FirebaseManager.get(url: url) { (result) in
            if let dic = result {
                completion(dic)
            }else{
                completion(nil)
            }
        }
        
    }

    
    class func retrieveMonthPointsFromUser(month: Int, completion: @escaping (_ result: Dictionary<String, Any>?)->()) {
        
        let userId = FirebaseManager().userID()
        let year = Date().year()
        let month = String(format: "%02d",month)
        
        let url = String(format: "https://wponto-e1f31.firebaseio.com/user-points/%@/%@/%@.json",userId, year, month)
        debugPrint("url:\(url)")
        
        FirebaseManager.get(url: url) { (result) in
            if let dic = result {
                completion(dic)
            }else{
                completion(nil)
            }
        }
        
    }
    
    class func retrieveDayPointsFromUser(day: Int, completion: @escaping (_ result: Dictionary<String, Any>?)->()) {
        
        let userId = FirebaseManager().userID()
        let year = Date().year()
        let month = Date().month()
        let day = String(format: "%02d", day)
        
        let url = String(format: "https://wponto-e1f31.firebaseio.com/user-points/%@/%@/%@/%@.json",userId, year, month, day)
        debugPrint("url:\(url)")
        
        FirebaseManager.get(url: url) { (result) in
            if let dic = result {
                completion(dic)
            }else{
                completion(nil)
            }
        }
        
    }

    
    //MARK: Public private
    
    func registerUrl() -> String {
        
        let year = Date().year()
        let month = Date().month()
        let day = Date().day()
        let userId = FirebaseManager().userID()
        let url = "https://wponto-e1f31.firebaseio.com/user-points/"
        return String(format: "%@/%@/%@/%@/%@.json", url, userId,year, month, day)
    }
    
    
}
