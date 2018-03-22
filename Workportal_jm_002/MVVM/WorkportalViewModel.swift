//
//  WorkportalViewModel.swift
//  Workportal_jm_002
//
//  Created by Juan Manuel Moreno on 21/3/18.
//  Copyright © 2018 uzupis. All rights reserved.
//

import Foundation

class WorkportalViewModel {
    
    var contentForClient: String = ""
    var contentForDays: String = ""
    var contentForDateFrom: String = ""
    var contentForDateTo: String = ""
    
    func getActivities() {
    
        let inbox = DataManager.instance.getActivities()
    }
}
