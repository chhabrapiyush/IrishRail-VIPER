//
//  RailDisplayListItem.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/16/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.
//

import Foundation
struct RailDisplayListItem: Equatable {
    
    let stationFullName: String
    let stationCode: String
    let dueIn: String
    let trainCode: String
    let late : String
    let direction: String
    
}

func == (leftSide: RailDisplayListItem, rightSide: RailDisplayListItem) -> Bool {
    var hasEqualSections = false
    hasEqualSections = rightSide.stationFullName  == leftSide.stationFullName
    
    if hasEqualSections == false {
        return false
    }
    
    hasEqualSections = rightSide.dueIn == rightSide.dueIn
    
    if hasEqualSections == false {
        return false
    }
    
    hasEqualSections = rightSide.trainCode == rightSide.trainCode
    
    return hasEqualSections
}
