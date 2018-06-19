//
//  RailListProtocols.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/15/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.

import UIKit

protocol RailListViewProtocol: class {
    var presenter: RailListPresenterProtocol? { get set }
    
    func setStartingStationName(_ name: String)
    func setDestinationStationName(_ name: String)
    func setLastUpdatedName(_ name: String)
    
    // PRESENTER -> VIEW

    func showRails(with Rails: RailListDisplayData, forStarttinStation: String)
    
    func showError(error: Error?)
    
    func showLoading()
    
    func hideLoading()
}

protocol RailListWireFrameProtocol: class {
        // PRESENTER -> WIREFRAME
    static func createRailListModule() -> UIViewController


}

protocol RailListPresenterProtocol: class {

    // VIEW -> PRESENTER

    var view: RailListViewProtocol? { get set }
    var interactor: RailListInteractorInputProtocol? { get set }
    var wireFrame: RailListWireFrameProtocol? { get set }
    
    func showRailForStaringStation(forStation Station:String?)
    func switchRailStations()
}

protocol RailListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER

    func didRetrieveRails(_ Rails: [RailStationModel], forStartingStation: String)
    func onError(error: Error?)
}

protocol RailListInteractorInputProtocol: class {
    var presenter: RailListInteractorOutputProtocol? { get set }
    var localDatamanager: RailListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: RailListRemoteDataManagerInputProtocol? { get set }
    func retriveRailsForStaringStation(station:String)
    
    // PRESENTER -> INTERACTOR

    
}

protocol RailListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol RailListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: RailListRemoteDataManagerOutputProtocol? { get set }
    // INTERACTOR -> REMOTEDATAMANAGER
    
     func retriveRailsForStaringStation(station:String)
}

protocol RailListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onRailsRetrieved(_ Rails: [RailStationModel], forStartingStation: String)
    func onError(error: Error?)
}

protocol RailListLocalDataManagerInputProtocol: class {
     // INTERACTOR -> LOCALDATAMANAGER

}
