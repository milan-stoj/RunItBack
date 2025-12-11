//
//  run_it_backTests.swift
//  run-it-backTests
//
//  Created by Milan Stojanovic on 12/11/25.
//

internal import Foundation
import Testing

@testable import RunItBack

struct TeamBalancerTests {

    @Test("Balances simple roster")
    @MainActor
    func balancesSimpleRoster() async throws {
        // Arrange
        let players: [Player] = [
            PlayerFactory.make(name: "Andy", tier: SkillTier.high),
            PlayerFactory.make(name: "Bob", tier:  SkillTier.mid),
            PlayerFactory.make(name: "Clem", tier:  SkillTier.low),
            PlayerFactory.make(name: "Doug", tier:  SkillTier.high),
            PlayerFactory.make(name: "Eric", tier:  SkillTier.mid),
            PlayerFactory.make(name: "Fox", tier:  SkillTier.low),
            PlayerFactory.make(name: "Greg", tier:  SkillTier.high),
            PlayerFactory.make(name: "Homer", tier:  SkillTier.mid),
            PlayerFactory.make(name: "Ian", tier:  SkillTier.low),
            PlayerFactory.make(name: "Jack", tier:  SkillTier.mid),
        ]

        // Act
        let result = TeamBalancer.balanceTeams(players: players)

        // Assert: sizes
        #expect(result.teamA.count == 5)
        #expect(result.teamB.count == 5)

        // Assert: all players assigned, none duplicated
        let all = Set(result.teamA + result.teamB)
        #expect(all.count == players.count)

        // Assert: skill difference small
        let sumA = result.teamA.reduce(into: 0) { $0 += $1.totalRating }
        let sumB = result.teamB.reduce(into: 0) { $0 += $1.totalRating }
        
        #expect(abs(sumA - sumB) <= 10)  // adjust threshold to your algorithm’s guarantee
    }
}
