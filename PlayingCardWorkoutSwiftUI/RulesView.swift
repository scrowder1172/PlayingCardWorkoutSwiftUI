//
//  RulesView.swift
//  PlayingCardWorkoutSwiftUI
//
//  Created by SCOTT CROWDER on 5/15/24.
//

import SwiftUI

struct RulesView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Rules")
                .font(.system(size: 40, weight: .bold))
            
            Text("The value of each card represents the number of exercises you do.\n\nJ = 11, Q = 12, K = 13, A = 14")
                .font(.system(size: 19, weight: .semibold))
                .multilineTextAlignment(.center)
            
            Text("♠️ = Push-ups\n\n❤️ = Sit-ups\n\n♣️ = Burpees\n\n♦️ = Jumping Jacks")
                .font(.system(size: 19, weight: .semibold))
            
            Spacer()
        }
        .padding(.top, 40)
    }
}

#Preview {
    RulesView()
}
