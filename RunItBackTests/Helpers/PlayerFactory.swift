//
//  PlayerFactory.swift
//  RunItBack
//
//  Created by Milan Stojanovic on 12/11/25.
//

@testable import RunItBack
internal import Foundation

enum SkillTier: Int {
    case low = 1, mid = 2, high = 3
}

struct PlayerFactory {
    static func make(name: String, tier: SkillTier) -> Player {
        switch tier {
        case .high:
            return .init(id: .init(), name: name,
                         offense: 4, defense: 4, playmaking: 5,
                         athleticism: 5, intangibles: 4, height: 65,
                         isSaved: false)
        case .mid:
            return .init(id: .init(), name: name,
                         offense: 3, defense: 3, playmaking: 3,
                         athleticism: 4, intangibles: 3, height: 60,
                         isSaved: false)
        case .low:
            return .init(id: .init(), name: name,
                         offense: 2, defense: 1, playmaking: 2,
                         athleticism: 2, intangibles: 3, height: 55,
                         isSaved: false)
        }
    }
}
