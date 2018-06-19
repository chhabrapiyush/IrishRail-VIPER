//
//  Constants.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/15/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.
//

import Foundation

var currentLocale = Locale.current
let appBundleID = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String
let appVersionString = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
let appBuildString = Bundle.main.infoDictionary?["CFBundleVersion"] as? String

let shortVersionString = "v" + appVersionString!

struct InternalDateFormatter {
    static let dateOnly: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = currentLocale
        
        formatter.timeStyle = .none
        formatter.dateStyle = .short
        return formatter
    }()
    
    static let timeOnly: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = currentLocale
        
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }()
    
    static let timeFromUTCDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = currentLocale
        
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }()
}
    struct AppStrings
    {
        static let destinationDalkeyString = "to Dalkey via Greystones"
        static let destinationRathdrumString = "to Rathdrum via Greystones"
        
         static let headerDalkeyGreystoneString = "Dalkey to Greystones"
        static let headerGreystoneRathdrumString = "Greystones to Rathdrum"
        
        static let headerGreystoneDalkeyString = "Greystones to Dalkey"
        static let headerRathdrumGreystoneString = "Rathdrum to Greystones"

        static let dalkeyStationString = "Dalkey"
        static let rathdrumStationString = "Rathdrum"
        
        static let rathdrumStationCode = "rdrum"
        static let dalkeyStationCode = "dlkey"
        static let greystonesStationCode = "gstns"
        
        static let lastUpdateString = "Not Updated"
    }
    
    

