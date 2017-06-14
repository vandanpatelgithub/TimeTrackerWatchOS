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
            clockOut()
        } else {
            clockIn()
        }
    }
    
    func clockIn() {
        updateUI(clockedIn: true)
        //        UserDefaults.standard.set(Date(), forKey: "clockedIn")
        //        UserDefaults.standard.synchronize()
        //
        //        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
        //            guard let clockedInDate = UserDefaults.standard.value(forKey: "clockedIn") as? Date else { return }
        //            let timeInterval = Int(Date().timeIntervalSince(clockedInDate))
        //
        //            let hours = timeInterval / 3600
        //            let minutes = (timeInterval % 3600) / 60
        //            let seconds = timeInterval % 60
        //
        //            self.middleLabel.setText("\(hours)h \(minutes)m \(seconds)s")
        //
        //            let totalTimeInterval = timeInterval + self.totalClockedTime()
        //
        //            let totalHours = totalTimeInterval / 3600
        //            let totalMinutes = (totalTimeInterval % 3600) / 60
        //            let totalSeconds = totalTimeInterval % 60
        //
        //            self.topLabel.setText("\(totalHours)h \(totalMinutes)m \(totalSeconds)s")
        //        }
    }
    
    func clockOut() {
        
        updateUI(clockedIn: false)
        clockedIn = true
        //        guard let clockedInDate = UserDefaults.standard.value(forKey: "clockedIn") as? Date else { return }
        //
        //        if var clockIns = UserDefaults.standard.array(forKey: "clockIns") as? [Date] {
        //            clockIns.insert(clockedInDate, at: 0)
        //            UserDefaults.standard.set(clockIns, forKey: "clockIns")
        //        } else {
        //            UserDefaults.standard.set([clockedInDate], forKey: "clockIns")
        //        }
        //
        //        if var clockOuts = UserDefaults.standard.array(forKey: "clockOuts") as? [Date] {
        //            clockOuts.insert(Date(), at: 0)
        //            UserDefaults.standard.set(clockOuts, forKey: "clockOuts")
        //        } else {
        //            UserDefaults.standard.set([Date()], forKey: "clockOuts")
        //        }
        //
        //        UserDefaults.standard.set(nil, forKey: "clockedIn")
        //        UserDefaults.standard.synchronize()
    }
    
    func totalClockedTime() -> Int {
        
        guard let clockedIns = (UserDefaults.standard.array(forKey: "clockIns") as? [Date])  else { return 0 }
        guard let clockOuts = (UserDefaults.standard.array(forKey: "clockOuts") as? [Date])  else { return 0 }
        
        print("ClockedIns : \(clockedIns.count)")
        print("ClockedOuts : \(clockOuts.count)")
        
        var seconds = 0
        
        for index in 0..<clockedIns.count {
            let currentInterval = Int(clockOuts[index].timeIntervalSince(clockedIns[index]))
            seconds += currentInterval
        }
        
        return seconds
    }
    
    
    
    
    
    
    
    
    
    
}
