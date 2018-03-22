//
//  DataManager.swift
//  Workportal_jm_002
//
//  Created by Juan Manuel Moreno on 22/3/18.
//  Copyright © 2018 uzupis. All rights reserved.
//
//  Clase singleton de negocio
//

import Foundation

private let single = DataManager() // Característica singleton pattern

class DataManager: NSObject {
    
    // MARK: - Singleton
    
    class var instance: DataManager {
        
        return single
    }
    
    // MARK: - Business

    /*
     * Completa las actividades en persistencia
     * TODO: Core data
     */
    func populateInboxForDB() {
        
        DBManager().populateInboxForDB()
    }

    /*
     * Consulta las actividades primero en ws y despues en persistencia si no hay ws dispoibles
     */
    func getActivities() -> NSMutableArray {
        
        var inbox: NSMutableArray = WSDelegate().consumeForActivities() // ws

        if inbox.count == 0 { // No hay inbox desde servicios

            inbox = DBManager().getActivitiesFromDB() // Conseguimos bandeja desde persistencia
        }
        
        return inbox
    }
}
