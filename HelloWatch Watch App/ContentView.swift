//
//  ContentView.swift
//  HelloWatch Watch App
//
//  Created by Alun King on 19/01/2026.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var timerModel:TimerModel
    @Environment(\.scenePhase) var scenePhase
    @State var selectedPage:Int = 0
    
    var body: some View {
        TabView(selection:$selectedPage){
            VStack {
                Text(format(timerValue:timerModel.timerDetails.timeElapsed)).monospaced().font(Font.title2)
                HStack {
                    Button(!timerModel.timerDetails.isRunning ? "Start" : "Lap") {
                        //code to start timer goes here
                        timerModel.start()
                    }
                    Button("Stop") {
                        //code to stop timer goes here
                        timerModel.stop()
                    }.disabled(!timerModel.timerDetails.isRunning)
                }
            }
            VStack{
                StopwatchLapsView(timerModel:timerModel)
            }
        }
        .padding()
        .onChange(of:scenePhase){
            switch scenePhase{
            case .background:
                print ("background")
                //save here
            case .inactive:
                
                print ("inactive")
            case .active:
                print ("active")
            @unknown default:
                print ("default")
            }
            
        }.tabViewStyle(.verticalPage)
    }
}

#Preview {
    ContentView(timerModel: TimerModel())
}


func format(timerValue:TimeInterval) ->String {
    let seconds = String(format:"%02d", (Int(timerValue) % 60))
    let mins = String(format:"%02d", (Int(timerValue/60)))
    let hundreths = String(format:"%02d", (Int(timerValue*100) % 100))
    
    return "\(mins):\(seconds):\(hundreths)"
}
