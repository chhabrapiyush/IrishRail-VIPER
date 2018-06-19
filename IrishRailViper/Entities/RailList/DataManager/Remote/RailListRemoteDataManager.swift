//
//  RailListRemoteDataManager.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/15/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.

import Foundation
import Alamofire
import AlamofireObjectMapper


class RailListRemoteDataManager:RailListRemoteDataManagerInputProtocol {


    var remoteRequestHandler: RailListRemoteDataManagerOutputProtocol?
    var startingStation: String?
    
    func retriveRailsForStaringStation(station:String) {
        
        
        if ( station == AppStrings.rathdrumStationCode)  // for Northbound
        {
            startingStation = station
            getStationData(atStation: AppStrings.greystonesStationCode, forNumMins: 90)
            getStationData(atStation: AppStrings.rathdrumStationCode, forNumMins: 90)
            
        } else { // for Southbound
            startingStation = station
            getStationData(atStation: AppStrings.dalkeyStationCode, forNumMins: 90)
        getStationData(atStation: AppStrings.greystonesStationCode, forNumMins: 90)
        }

    }
    
    func getStationData(atStation station:String , forNumMins mins:Int)
    {
        //
        // Calling IrishRail API
        //
        let globalQueue = DispatchQueue.global(qos:.userInitiated)
        Alamofire.request(Endpoints.GetRailStationData(station, mins))
            .validate(statusCode: 200...200)
            .responseData(queue:globalQueue)
            { response in
                print("Request is \(response.request!)")  //  URL request
                print("")
                switch response.result
                {
                case .success(let data):
                    
                    let string1 = String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
                    print(string1)
                    let xph = XmlParserHandler()
                    var infoArray : [RailStationModel] = []
                    if (self.startingStation == AppStrings.rathdrumStationCode )
                    {
                         infoArray = xph.parseTrainData(xmlData: data, direction: "Northbound")
                    } else if (self.startingStation == AppStrings.dalkeyStationCode ) {
                        infoArray = xph.parseTrainData(xmlData: data, direction: "Southbound")
                    }
                    self.remoteRequestHandler?.onRailsRetrieved(infoArray, forStartingStation: self.startingStation!)
                    
                case .failure(let error):
                    self.remoteRequestHandler?.onError(error: error)
                }
        }
    }
    
}
