//
//  WorkportalViewModel.swift
//  Workportal_jm_002
//
//  Created by Juan Manuel Moreno on 21/3/18.
//  Copyright © 2018 uzupis. All rights reserved.
//
//  VM de actividades siguiendo el patron MVVM

import Foundation

class WorkportalViewModel {
    
    var inbox: NSMutableArray!
    
    // MARK: - Business
    
    /*
     * Completa las actividades
     */
    func populateInboxForDB() {
        
        DataManager.instance.populateInboxForDB()
    }

    /*
     * Cosulta las actividades
     */
    func getActivities() -> NSMutableArray {
    
        inbox = DataManager.instance.getActivities()
        return inbox
    }
}
