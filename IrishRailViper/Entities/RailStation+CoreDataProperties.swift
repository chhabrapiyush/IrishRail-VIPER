//
//  RailStation+CoreDataProperties.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/13/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.
//
//

import Foundation
import CoreData


extension RailStation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RailStation> {
        return NSFetchRequest<RailStation>(entityName: "RailStation")
    }

    @NSManaged public var serverTime: String?
    @NSManaged public var trainCode: String?
    @NSManaged public var stationFullName: String?
    @NSManaged public var queryTime: String?
    @NSManaged public var stationCode: String?
    @NSManaged public var trainDate: String?
    @NSManaged public var origin: String?
    @NSManaged public var destination: String?
    @NSManaged public var originTime: String?
    @NSManaged public var destinationTime: String?
    @NSManaged public var status: String?
    @NSManaged public var lastLocation: String?
    @NSManaged public var dueIn: String?
    @NSManaged public var late: String?
    @NSManaged public var expArrival: String?
    @NSManaged public var expDepart: String?
    @NSManaged public var scheduleArrival: String?
    @NSManaged public var scheduleDepart: String?
    @NSManaged public var direction: String?
    @NSManaged public var trainType: String?
    @NSManaged public var locationType: String?

}
