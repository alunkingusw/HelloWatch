//
//  HelloWatchApp.swift
//  HelloWatch Watch App
//
//  Created by Alun King on 19/01/2026.
//

import SwiftUI

@main
struct HelloWatch_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            //create timermodel and pass to content view
            @StateObject var timerModel:TimerModel = TimerModel()
            ContentView(timerModel:timerModel)
        }
    }
}
