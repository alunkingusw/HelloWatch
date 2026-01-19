//
//  TimerModel.swift
//  HelloWatch
//
//  Created by Alun King on 19/01/2026.
//
import SwiftUI

class TimerModel {
    
    var timerDetails: TimerDetails = TimerDetails()
    /* the question mark means that the variable is an 'optional'
     * optional values can be null or not null, we are not sure
     * so we mark them with a question mark.
     * When we want to use them, we have to unwrap them, as shown below (line 33 / 36)
     */
    var timer: Timer?
    
    
    func start(){
        if timerDetails.isRunning == false{
            timerDetails.isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats:true) {_ in
                self.timerDetails.timeElapsed += 0.01
            }
            
        }
    }
    
    func stop(){
        if timerDetails.isRunning{
            
            //one way of accessing timer
            timer?.invalidate()
            
            //another way
            if let timerUnwrapped = timer{
                timerUnwrapped.invalidate()
            }
            
            timerDetails.isRunning = false
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
