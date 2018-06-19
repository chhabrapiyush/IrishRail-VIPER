 //
//  XmlpParserHandler.swift
 //  IrishRailViper
 //
 //  Created by CHHABRA, PIYUSH on 4/13/18.
 //  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.
//

import Foundation

class XmlParserHandler : NSObject
{

    var xmlText:String = ""
    var StationDataArray:[RailStationModel] = []
    var currentStationData:RailStationModel!
    var direction:String = ""
    
    func parseTrainData(xmlData:Data, direction:String) -> [RailStationModel]
    {
        let xp = XMLParser(data: xmlData)
        self.direction = direction
        xp.delegate = self
        xp.shouldProcessNamespaces = true
        xp.parse()
        
        return StationDataArray
    }
}

extension XmlParserHandler : XMLParserDelegate
{
    func parserDidStartDocument(_ parser: XMLParser) {
        print ("XML Parse Did Start")
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print ("XML Parse Did End")
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:])
    {
        xmlText = ""
        if ( elementName == "objStationData")
        {
            currentStationData = RailStationModel()
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        xmlText = xmlText.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines )
        
        guard let qName = qName else {
            return
        }
        switch qName {
            
        case "StationData":
            currentStationData.Servertime =  xmlText
            
        case "Traincode":
            currentStationData.Traincode =  xmlText
        case "Stationfullname":
            currentStationData.Stationfullname =  xmlText
        case "Stationcode":
            currentStationData.Stationcode =  xmlText
        case "Querytime":
            currentStationData.Querytime =  xmlText
        case "Traindate":
            currentStationData.Traindate =  xmlText
        case "Origin":
            currentStationData.Origin =  xmlText
        case "Destination":
            currentStationData.Destination =  xmlText
        case "Origintime":
            currentStationData.Origintime =  xmlText
        case "Destinationtime":
            currentStationData.Destinationtime =  xmlText
        case "Status":
            currentStationData.Status =  xmlText
        case "Lastlocation":
            currentStationData.Lastlocation =  xmlText
            
        case "Duein":
            currentStationData.Duein =  xmlText
        case "Late":
            currentStationData.Late =  xmlText
        case "Exparrival":
            currentStationData.Exparrival =  xmlText
        case "Expdepart":
            currentStationData.Expdepart =  xmlText
        case "Scharrival":
            currentStationData.Scharrival =  xmlText
        case "Schdepart":
            currentStationData.Schdepart =  xmlText
        case "Direction":
            currentStationData.Direction =  xmlText
        case "Traintype":
            currentStationData.Traintype =  xmlText
        case "Locationtype":
            currentStationData.Locationtype =  xmlText
        case "objStationData":
            // Need to filter for selected direction
            if ( currentStationData.Direction == direction)
            {
                
                if (direction == "Southbound") && ( currentStationData.Stationcode == "DLKEY")
                {
                    if currentStationData.Destination != "Greystones"
                    {
                        return
                    }
                }
                // If this station Info for Greystones Southbound then only want Trains
                // Going to Rathdrum and not just to Bray!
                
                if (direction == "Southbound") && ( currentStationData.Stationcode == "GSTNS")
                {
                    if currentStationData.Destination != "Rosslare Europort"
                    {
                        return
                    }
                }
                StationDataArray.append(currentStationData)
            }
        default:
            
            print("In default")
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        xmlText.append(string)
    }
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error)
    {
        print("Parse Error: ", parseError.localizedDescription)
    }
}


