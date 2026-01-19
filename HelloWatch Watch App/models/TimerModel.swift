//
//  TimerModel.swift
//  HelloWatch
//
//  Created by Alun King on 19/01/2026.
//
import SwiftUI

class TimerModel {
    
    var timerDetails: TimerDetails = TimerDetails()
    var timer: Timer?
    
    
    func start(){
        if timerDetails.isRunning == false{
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats:true) {_ in
                self.timerDetails.timeElapsed += 0.01
            }
        }
    }
    func stop(){
        if timerDetails.isRunning{
            timer?.invalidate()
        }
    }
    
    func recordLap(){
        //fill in missing code
    }
    func reset(){
        //fill in missing code
    }
}

struct TimerDetails{
    var laps:[TimeInterval]
    var isRunning:Bool
    var timeElapsed:TimeInterval
    
    init(){
        laps = []
        isRunning = false
        timeElapsed = 0
    }
}
