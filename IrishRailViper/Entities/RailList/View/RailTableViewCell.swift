//
//  RailTableViewCell.swift
//  IrishRailViper
//
//  Created by CHHABRA, PIYUSH on 4/15/18.
//  Copyright © 2018 CHHABRA, PIYUSH. All rights reserved.

import UIKit
import AlamofireImage

class RailTableViewCell: UITableViewCell {
    

    @IBOutlet weak var delayedMinutesLabel: UILabel!
    @IBOutlet weak var delayedInfoLabel: UILabel!
    
    func set(forRail rail: RailDisplayListItem) {
        self.selectionStyle = .none
        
      // SHow zero Rows Data
    //Need to improve
        if(rail.stationCode == ""){
            
            self.delayedMinutesLabel.text = " "
            self.delayedInfoLabel.text = rail.late
            
        }
        else{
        self.delayedMinutesLabel.text = "\(rail.dueIn.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines )) Mins"
        self.delayedInfoLabel.text = (rail.late == "0") ? "On Time" : "Delayed \(rail.late) Mins"
        }

    }
    
    
}
