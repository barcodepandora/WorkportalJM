//
//  WSDelegate.swift
//  Workportal_jm_002
//
//  Created by Juan Manuel Moreno on 21/3/18.
//  Copyright © 2018 uzupis. All rights reserved.
//
//  TODO: *Corregir URL *Singleton *Asynchronous
//

import Foundation
import Reachability

class WSDelegate {
    
    var jsonUrl = NSURL()
    
    //  MARK: - Util
    
    /*
     * Consulta las actividades desde ws
     */
    func consumeForActivities() -> NSMutableDictionary {
        
        var forest = NSMutableDictionary()
        
        // Evaluamos conectividad con framework cocoapods Reachability
        let networkReachability: Reachability = Reachability.forInternetConnection()
        if !networkReachability.isReachable() {
            
            print("No internet connection")
        } else {
            
            jsonUrl = NSURL(string: "https://api.myjson.com/bins/10yg1t")!
            let request: NSURLRequest = NSURLRequest.init(url: jsonUrl as URL)
            var response: URLResponse?
            let _: NSError?
            do {
                
                let urlData = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response)
                let result: NSMutableDictionary = try JSONSerialization.jsonObject(with: urlData, options:JSONSerialization.ReadingOptions.mutableContainers) as! NSMutableDictionary
                forest = result.mutableCopy() as! NSMutableDictionary
            } catch (let e) {
                
                print(e)
            }
        }
        return forest
    }    
}
