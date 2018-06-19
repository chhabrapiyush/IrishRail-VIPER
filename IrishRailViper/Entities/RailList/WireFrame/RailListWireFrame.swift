//
//  RailListWireFrame.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/15/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.

import UIKit

class RailListWireFrame: RailListWireFrameProtocol {
    
    class func createRailListModule() -> UIViewController {
        
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "RailsNavigationController")
        if let view = navController.childViewControllers.first as? RailListView {
            let presenter: RailListPresenterProtocol & RailListInteractorOutputProtocol = RailListPresenter()
            let interactor: RailListInteractorInputProtocol & RailListRemoteDataManagerOutputProtocol = RailListInteractor()
            let localDataManager: RailListLocalDataManagerInputProtocol = RailListLocalDataManager()
            let remoteDataManager: RailListRemoteDataManagerInputProtocol = RailListRemoteDataManager()
            let wireFrame: RailListWireFrameProtocol = RailListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            return navController
            
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
