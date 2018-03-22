//
//  DBManager.swift
//  Workportal_jm_002
//
//  Created by Juan Manuel Moreno on 22/3/18.
//  Copyright © 2018 uzupis. All rights reserved.
//
//  Experto en persistencia
//

import Foundation

class DBManager: NSObject {
    
    // MARK: - Business

    /*
     * Completa las actividades en persistencia
     * TODO: Core data
     */
    func populateInboxForDB() {
        
        var inbox = NSMutableArray()
        
        var activity = NSMutableDictionary()
        activity.setValue("Sandy", forKey: "employee")
        activity.setValue("Comprar zapatos", forKey: "process")
        activity.setValue(1, forKey: "activityId")
        activity.setValue("2018-03-22", forKey: "beginDate")
        activity.setValue("2018-03-29", forKey: "endDate")
        inbox.add(activity)
        
        UserDefaults.standard.set(inbox, forKey: "inbox") // Persiste en UserDefaults
    }

    /*
     * Consulta las actividades desde persistencua
     */
    func getActivitiesFromDB() -> NSMutableArray {
        
        var inbox = NSMutableArray()
        inbox = UserDefaults.standard.array(forKey: "inbox") as! NSMutableArray
        return inbox
    }

}
