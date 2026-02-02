//
//  TimerModel.swift
//  HelloWatch
//
//  Created by Alun King on 19/01/2026.
//
import SwiftUI


class TimerModel:ObservableObject{
    
    @Published var timerDetails: TimerDetails = TimerDetails()
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
            
        }else{
            //record a lap here
            recordLap()
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
        if let lastLap = timerDetails.laps.last{
            timerDetails.laps.append(timerDetails.timeElapsed - lastLap)
        }else{
            timerDetails.laps.append(timerDetails.timeElapsed)
        }
        
        
    }
    func reset(){
        //fill in missing code
    }
    func save(){
        
    }
    func load(){
        
    }
    
}

struct TimerDetails:Codable{
    var laps:[TimeInterval]
    var isRunning:Bool
    var timeElapsed:TimeInterval
    
    init(){
        laps = []
        isRunning = false
        timeElapsed = 0
    }
}
