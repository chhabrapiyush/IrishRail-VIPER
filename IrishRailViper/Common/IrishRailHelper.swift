//
//  IrishRailHelper.swift
//  
//
//  Created by CHHABRA, PIYUSH on 4/17/18.
//

import Foundation


class IrishRailHelper {
    
  static func getTimeString () -> String
    {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let date = Date()
        return dateFormatter.string(from: date)
    }
    
}


