//
//  DataManager.swift
//  Workportal_jm_002
//
//  Created by Juan Manuel Moreno on 22/3/18.
//  Copyright © 2018 uzupis. All rights reserved.
//

import Foundation

private let single = DataManager()

class DataManager: NSObject {
    
    // MARK: - Singleton
    
    class var instance: DataManager {
        
        return single
    }
    
    // MARK: - Business
    
    func getActivities() -> NSMutableDictionary {
        
        var inbox: NSMutableDictionary = WSDelegate().consumeForActivities()
        if inbox.count == 0 {
            
            // Conseguimos bandeja desde persistencia
            inbox = DBManager().getActivitiesFromDB()
        }
        //        VALIDAR CONEXION A INTERNET
        //        let wsDelegate = WSDelegate()
        //        wsDelegate.consumeForActivities()
        //        PERSISTIR
        //        ALISTAR PARA EL VC

        return inbox
    }
}
