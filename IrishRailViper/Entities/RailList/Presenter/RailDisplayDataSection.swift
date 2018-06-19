//
//  RailDisplayDataSection.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/15/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.
//

import Foundation

struct RailDisplayDataSection {
    let name: String
    var railItems: [RailDisplayListItem] 
}

extension RailDisplayDataSection : Equatable {
    static func == (leftSide: RailDisplayDataSection, rightSide: RailDisplayDataSection) -> Bool {
        return rightSide.railItems == leftSide.railItems
    }
}

