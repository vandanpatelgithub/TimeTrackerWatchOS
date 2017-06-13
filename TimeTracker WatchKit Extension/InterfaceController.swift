//
//  InterfaceController.swift
//  TimeTracker WatchKit Extension
//
//  Created by Preeti Patel on 12/06/17.
//  Copyright © 2017 Vandan Patel. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var clockButton: WKInterfaceButton!
    @IBOutlet var middleLabel: WKInterfaceLabel!
    @IBOutlet var topLabel: WKInterfaceLabel!
    
    var clockedIn = false
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        updateUI(clockedIn: clockedIn)
    }
    
    func updateUI(clockedIn: Bool) {
        if clockedIn {
            //UI For Clocked In
            topLabel.setHidden(false)
            middleLabel.setText("5m 22s")
            clockButton.setTitle("Clock-Out")
            clockButton.setBackgroundColor(UIColor.green)
        } else {
            //UI For Clocked Out
            topLabel.setHidden(true)
            middleLabel.setText("Today\n3h 44m")
            clockButton.setTitle("Clock-In")
            clockButton.setBackgroundColor(UIColor.red)
        }
    }

    @IBAction func ClockInOutTapped() {
        if clockedIn {
            updateUI(clockedIn: clockedIn)
            clockedIn = false
        } else {
            updateUI(clockedIn: clockedIn)
            clockedIn = true
        }
    }
}
