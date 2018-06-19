//
//  RailListDisplayDataCollection.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/16/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.
//

import Foundation
class RailListDisplayDataCollection {
    
    var sections : [AllStations: [RailDisplayListItem]] = [:]
    var startingStation: String?
    init() { }
    
    func addDisplayListForRailItems(_ railStations: [RailStationModel]) {
        for railStation in railStations {
            let railDisplayItem = RailDisplayListItem(stationFullName : railStation.Stationfullname, stationCode: railStation.Stationcode, dueIn : railStation.Duein, trainCode: railStation.Traincode, late: railStation.Late, direction: railStation.Direction )
            
            addRailDisplayItem(railDisplayItem, station: startingStationFromStationCode(railStation.Stationcode.lowercased()))
        }
    }
    
    func addRailDisplayItem(_ displayItem: RailDisplayListItem, station: AllStations) {
        if var realSection : [RailDisplayListItem] = sections[station] {
            realSection.append(displayItem)
            sections[station] = realSection
        } else {
            var newSection : [RailDisplayListItem] = []
            newSection.append(displayItem)
            sections[station] = newSection
        }
    }
    
    func displaySectionForStation(_ startingStation: AllStations) -> RailDisplayDataSection {
        
        let sectionTitle = sectionTitleForStartingStation(startingStation)
        if let  items = sections[startingStation]{
            
             return RailDisplayDataSection(name: sectionTitle, railItems: items)
        }
        else{
            let noResutDisplay =  RailDisplayListItem(stationFullName : "", stationCode: "", dueIn : "", trainCode:"", late: "No Trains Available", direction: "" )
             return RailDisplayDataSection(name: sectionTitle, railItems: [noResutDisplay])
        }


    }
    
    func collectedDisplayData() -> RailListDisplayData {
        
        var displaySections : [RailDisplayDataSection] = []
        
        var stations: [AllStations] = []
        if startingStation == AppStrings.dalkeyStationString
        {
           stations = [ .dalkey,.greystone]
        } else {
            
            stations = [.rathdrum, .greystone]
        }
        
        
        for station in stations {
            
//            let itemArray = sections[station]
//            if (itemArray != nil) {
                let displaySection = displaySectionForStation(station)
                displaySections.insert(displaySection, at: displaySections.endIndex)
//            }
        }
        
        return RailListDisplayData(sections: displaySections)
        
    }
    
    func sectionTitleForStartingStation(_ startingStation: AllStations) -> String {
        switch startingStation {
        case .rathdrum:
            return AppStrings.headerRathdrumGreystoneString
        case .dalkey:
            return AppStrings.headerDalkeyGreystoneString
        case .greystone:
            if self.startingStation == AppStrings.dalkeyStationString {
                
               return AppStrings.headerRathdrumGreystoneString
            }
            else
            {
                return AppStrings.headerGreystoneDalkeyString
            }
            
        case .bray:
            return "Bray"
            
        }
    }
        
        func startingStationFromStationCode(_ stationCode: String) -> AllStations {
            switch stationCode {
            case "rdrum":
                return .rathdrum
            case "dlkey" :
                return .dalkey
            case "gstns":
                return .greystone
            case "bray":
                return .bray
                
            default:
                    return.rathdrum
            }
    }
}

