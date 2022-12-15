//
//  FeatureCardView.swift
//  MyTradingJournal
//
//  Created by James Sedlacek on 11/22/22.
//

import SwiftUI

struct FeatureCardView: View {
    let featureCard: FeatureCard
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            featureCard.iconImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text(featureCard.title)
                .font(.system(size: 16, weight: .medium))
                .multilineTextAlignment(.center)
        }
        .frame(width: 80, height: 90)
        .padding()
        .foregroundColor(.white)
        .background(featureCard.backgroundColor)
        .cornerRadius(12)
    }
}

struct FeatureCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    FeatureCardView(featureCard: .unlimitedEntries)
                    FeatureCardView(featureCard: .importData)
                    FeatureCardView(featureCard: .biometricsLock)
                    FeatureCardView(featureCard: .automaticBackups)
                }
            }.padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    FeatureCardView(featureCard: .customTags)
                    FeatureCardView(featureCard: .moreStats)
                    FeatureCardView(featureCard: .moreDates)
                    FeatureCardView(featureCard: .unlimitedGoals)
                }
            }.padding(.horizontal, -90)
        }
    }
}
