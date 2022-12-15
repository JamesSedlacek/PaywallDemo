//
//  PaywallView.swift
//  MyTradingJournal
//
//  Created by James Sedlacek on 11/22/22.
//

import SwiftUI

struct PaywallView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedPlan: PremiumPlan = .yearly
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGroupedBackground).ignoresSafeArea()
            VStack(alignment: .center, spacing: 16) {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("My Trading Journal")
                                    .font(.system(size: 26, weight: .semibold))
                                Spacer()
                                xmarkButton()
                            }
                            Text("Premium")
                                .font(.system(size: 40, weight: .bold))
                        }
                        Spacer()
                    }
                }.padding(20)
                
                VStack {
                    InfiniteScroller(contentWidth: getContentWidth(), direction: .forward) {
                        HStack(spacing: 16) {
                            FeatureCardView(featureCard: .unlimitedEntries)
                            FeatureCardView(featureCard: .importData)
                            FeatureCardView(featureCard: .biometricsLock)
                            FeatureCardView(featureCard: .automaticBackups)
                        }.padding(8)
                    }
                    
                    InfiniteScroller(contentWidth: getContentWidth(), direction: .backward) {
                        HStack(spacing: 16) {
                            FeatureCardView(featureCard: .customTags)
                            FeatureCardView(featureCard: .moreStats)
                            FeatureCardView(featureCard: .moreDates)
                            FeatureCardView(featureCard: .unlimitedGoals)
                        }.padding(8)
                    }
                }
                
                Text("Choose a plan")
                    .foregroundColor(.secondary)
                    .font(.system(size: 20, weight: .medium))
                    .padding(.top)
                MonthlyPlanView(selectedPlan: $selectedPlan).padding(.bottom, 12)
                YearlyPlanView(selectedPlan: $selectedPlan).padding(.bottom)
                actionButton()
                restorePurchasesButton()
            }
            .scaleEffect(CGSize(width: isIPhone14ProMax() ? 1 : UIScreen.main.bounds.size.width / 430.0,
                                height: isIPhone14ProMax() ? 1 : UIScreen.main.bounds.size.height / 932.0))
            .padding(.horizontal, isIPhone14ProMax() ? 0 : -20)
            .animation(.spring(), value: selectedPlan)
        }
    }
    
    private func getContentWidth() -> CGFloat {
        let cardWidth: CGFloat = 90
        let spacing: CGFloat = 16
        let padding: CGFloat = 8
        let contentWidth: CGFloat = (cardWidth * 4) + (spacing * 6) + (padding * 7)
        return contentWidth
    }
    
    private func isIPhone14ProMax() -> Bool {
        return UIScreen.main.bounds.size.width == 430.0 && UIScreen.main.bounds.size.height == 932.0
    }
    
    private func xmarkButton() -> some View {
        return Button {
            dismiss()
        } label: {
            Image.xmarkCircleIcon
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(Color.white.opacity(0.6),
                                 Color.secondary.opacity(0.4))
        }
    }
    
    private func actionButton() -> some View {
        return Button {
            // TODO: action
        } label: {
            Text(selectedPlan == .yearly ? "Start Free Trial" : "Continue")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
                .padding(12)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal, 24)
        }
    }
    
    private func restorePurchasesButton() -> some View {
        return Button {
            // TODO: action
        } label: {
            Text("Restore Purchases")
                .font(.system(size: 16, weight: .medium))
        }.padding(8)
    }
}

struct PaywallView_Previews: PreviewProvider {
    static var previews: some View {
        PaywallView()
    }
}
