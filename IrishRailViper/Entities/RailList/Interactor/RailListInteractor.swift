//
//  RailListInteractor.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/15/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.

class RailListInteractor: RailListInteractorInputProtocol {
    weak var presenter: RailListInteractorOutputProtocol?
    var localDatamanager: RailListLocalDataManagerInputProtocol?
    var remoteDatamanager: RailListRemoteDataManagerInputProtocol?
    
    
    func retriveRailsForStaringStation(station:String)
    {
        var stationCode: String?
        
        if ( station == AppStrings.rathdrumStationString)  // Northbound
        {
            stationCode = AppStrings.rathdrumStationCode
        }
        else {
            stationCode = AppStrings.dalkeyStationCode
        }
        
        if let stationCode = stationCode {
            remoteDatamanager?.retriveRailsForStaringStation(station: stationCode)
        }
    }
}

extension RailListInteractor: RailListRemoteDataManagerOutputProtocol {
    func onError(error: Error?) {
        presenter?.onError(error: error)
    }
    
    

    func onRailsRetrieved(_ rails: [RailStationModel], forStartingStation startingstation: String) {
        
        print ("starting station == \(startingstation)")
        presenter?.didRetrieveRails(rails, forStartingStation: startingstation)
        
        // to save in DB

    }
}
