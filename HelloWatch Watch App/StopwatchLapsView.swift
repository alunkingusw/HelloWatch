//
//  StopwatchLapsView.swift
//  HelloWatch Watch App
//
//  Created by Alun King on 26/01/2026.
//

import SwiftUI

struct StopwatchLapsView: View {
    @ObservedObject var timerModel:TimerModel
    var body: some View {
        ScrollView{
            Text(format(timerValue:timerModel.timerDetails.timeElapsed))
            ForEach(timerModel.timerDetails.laps.indices, id: \.self){ index in
                VStack(alignment: .leading){
                    Text("Lap \(index+1) : \(format(timerValue: timerModel.timerDetails.laps[index]))").font(.body).padding(.vertical, 5).monospaced()
                }
            }
        }
    }
}

#Preview {
    StopwatchLapsView(timerModel:TimerModel())
}
