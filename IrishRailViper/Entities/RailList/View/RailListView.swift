//
//  RailListView.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/15/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.

import UIKit
import PKHUD

let RailTableViewCellIdentifier = "RailTableViewCell"
class RailListView: UIViewController {
    
    // These shared variable dictionaries  are accessed from multiple threads as such
    // need to be made thread safe for writing
    
    @IBOutlet weak var startingStationLabel: UILabel!
    @IBOutlet weak var destinationStationLabel: UILabel!
    @IBOutlet weak var switchButton: UIButton!

    
    @IBOutlet weak var lastUpdatedText: UILabel!
    @IBAction func switchStationDirection(_ sender: Any) {
        presenter?.switchRailStations()
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        
    presenter?.showRailForStaringStation(forStation: nil)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: RailListPresenterProtocol?
    var RailList: [RailStationModel] = []
    var railListDisplayData : RailListDisplayData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.allowsSelection = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 48
         tableView.tableFooterView = UIView()
        
        presenter?.showRailForStaringStation(forStation:AppStrings.rathdrumStationString)
       
    }
}

extension RailListView: RailListViewProtocol {
    
    
    func setStartingStationName(_ name: String) {
        
        DispatchQueue.main.async {
            self.startingStationLabel.text = name
        }
       
    }
    
    func setDestinationStationName(_ name: String) {
        DispatchQueue.main.async {
            self.destinationStationLabel.text = name
        }
        
    }
    
    func setLastUpdatedName(_ name: String) {
        
        DispatchQueue.main.async {
            self.lastUpdatedText.text = name
        }
       
    }
    
    func showError(error: Error?) {

        HUD.flash(.label(error?.localizedDescription ?? "Error"), delay: 2.0)
    }
    
    
func showRails(with railData: RailListDisplayData, forStarttinStation: String) {
    railListDisplayData = railData
    reloadEntries()
    }
    
    func reloadEntries()
    {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
       
    }
    func showLoading() {
        DispatchQueue.main.async {
           HUD.show(.progress)
        }
      
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
                 HUD.hide()
        }
  
    }
    
}

extension RailListView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return railListDisplayData?.sections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let railSection = railListDisplayData?.sections[section]
        
        return railSection!.railItems.count
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let railSection = railListDisplayData?.sections[section]
        return railSection!.name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let railSection = railListDisplayData?.sections[(indexPath as NSIndexPath).section]
        let railItem = railSection!.railItems[(indexPath as NSIndexPath).row]
      
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RailTableViewCellIdentifier, for: indexPath) as! RailTableViewCell
           cell.set(forRail: railItem)        
        return cell
    }

}
