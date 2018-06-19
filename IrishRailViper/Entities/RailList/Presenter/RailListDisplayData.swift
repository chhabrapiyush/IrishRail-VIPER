//
//  RailListDisplayData.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/15/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.
//

import Foundation

struct RailListDisplayData {
    let sections: [RailDisplayDataSection]
}

extension RailListDisplayData: Equatable {
    
    static func == (leftSide: RailListDisplayData, rightSide: RailListDisplayData) -> Bool {
        return rightSide.sections == leftSide.sections
    }
}
