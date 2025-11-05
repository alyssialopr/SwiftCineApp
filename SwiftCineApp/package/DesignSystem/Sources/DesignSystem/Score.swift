//
//  Score.swift
//  DesignSystem
//
//  Created by LORSOLD PRADON Alyssia on 05/11/2025.
//

import SwiftUI

public struct Score: View {
    public var score: Double 
    
    public init(score: Double) {
        self.score = score
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                .frame(width: 50, height: 50)

            Circle()
                .trim(from: 0, to: CGFloat(score / 10))
                .stroke(Color.black, lineWidth: 2)
                .rotationEffect(.degrees(-90))
                .frame(width: 50, height: 50)

            Text(String(format: "%.1f", score))
                .font(.title3)
                .bold()
                .foregroundColor(.black)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        Score(score: 10)
        Score(score: 9.1)
        Score(score: 0)
    }
}
