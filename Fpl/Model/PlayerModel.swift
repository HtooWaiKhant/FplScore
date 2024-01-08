// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let playerInfo = try? JSONDecoder().decode(PlayerInfo.self, from: jsonData)

import Foundation

// MARK: - PlayerModel
struct PlayerModel: Codable {
    let data: [Info]
    let message: String
}

// MARK: - Info
struct Info: Codable {
    let id, playername, teamname, image: String
    let totalpoints, prevpoints: Int
    let nowcost, score: Double
}
