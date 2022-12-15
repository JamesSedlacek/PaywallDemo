//
//  FeatureCard.swift
//  MyTradingJournal
//
//  Created by James Sedlacek on 11/22/22.
//

import SwiftUI

enum FeatureCard {
    case unlimitedEntries
    case importData
    case biometricsLock
    case automaticBackups
    case customTags
    case moreStats
    case moreDates
    case unlimitedGoals
    
    var title: String {
        switch self {
        case .unlimitedEntries:
            return "Unlimited Entries"
        case .importData:
            return "Import Data"
        case .biometricsLock:
            return "Biometrics Lock"
        case .automaticBackups:
            return "Automatic Backups"
        case .customTags:
            return "Custom Tags"
        case .moreStats:
            return "More Stats"
        case .moreDates:
            return "More Dates"
        case .unlimitedGoals:
            return "Unlimited Goals"
        }
    }
    
    var iconImage: Image {
        switch self {
        case .unlimitedEntries:
            return .entriesIcon
        case .importData:
            return .importIcon
        case .biometricsLock:
            return .biometricsIcon
        case .automaticBackups:
            return .cloudIcon
        case .customTags:
            return .tagsIcon
        case .moreStats:
            return .statsIcon
        case .moreDates:
            return .calendarIcon
        case .unlimitedGoals:
            return .goalsIcon
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .unlimitedEntries:
            return .darkOrange
        case .importData:
            return .blue
        case .biometricsLock:
            return .green
        case .automaticBackups:
            return .darkRed
        case .customTags:
            return .blue
        case .moreStats:
            return .green
        case .moreDates:
            return .blue
        case .unlimitedGoals:
            return .green
        }
    }
}
