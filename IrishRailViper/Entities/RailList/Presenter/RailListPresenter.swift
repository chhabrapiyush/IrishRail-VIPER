//
//  RailListPresenter.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/15/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.
import  Foundation
class RailListPresenter: RailListPresenterProtocol {

    
    
    weak var view: RailListViewProtocol?
    var interactor: RailListInteractorInputProtocol?
    var wireFrame: RailListWireFrameProtocol?
    
    var stationsOfInterestNorthbound:[String:[RailStationModel]] = [:]
    var stationsOfInterestSouthbound:[String:[RailStationModel]] = [:]
    var startingStation:String = ""
    var destinationStation:String = ""
    
    func switchRailStations(){
        
        if startingStation == AppStrings.rathdrumStationString
        {
            startingStation = AppStrings.dalkeyStationString
            destinationStation = AppStrings.destinationRathdrumString
            
        }
        else
        {
            startingStation = AppStrings.rathdrumStationString
            destinationStation =  AppStrings.destinationDalkeyString
            
        }
        
        view?.setStartingStationName(startingStation)
        view?.setDestinationStationName(destinationStation)
        showRailForStaringStation(forStation: startingStation)
        
    }
    func showRailForStaringStation(forStation station:String?) {
        
        if let station = station {
            startingStation = station
        }
      
        if startingStation == AppStrings.dalkeyStationString
        {
            startingStation = AppStrings.dalkeyStationString
            destinationStation =  AppStrings.destinationRathdrumString
        } else {
            startingStation = AppStrings.rathdrumStationString
            destinationStation =  AppStrings.destinationDalkeyString
        }
        
        view?.setStartingStationName(startingStation)
        view?.setDestinationStationName(destinationStation)
        view?.setLastUpdatedName(AppStrings.lastUpdateString)
        view?.showLoading()
        
        interactor?.retriveRailsForStaringStation(station: startingStation)
    }
}

extension RailListPresenter: RailListInteractorOutputProtocol {
    func onError(error: Error?) {
        view?.hideLoading()
        view?.showError(error: error)
    }
    func didRetrieveRails(_ rails: [RailStationModel], forStartingStation: String) {
        view?.hideLoading()
        let collection = RailListDisplayDataCollection()
        collection.startingStation = startingStation
            collection.addDisplayListForRailItems(rails)
            let railData: RailListDisplayData? =  collection.collectedDisplayData()
            if let railData = railData {
                view?.showRails(with: railData, forStarttinStation: forStartingStation)
                view?.setLastUpdatedName(IrishRailHelper.getTimeString())
            }
        }
    }


