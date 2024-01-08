//
//  PlayerTableCellViewModel.swift
//  Fpl
//
//  Created by Htoo Wai Khant on 8/1/2567 BE.
//

import Foundation

class PlayerTableCellViewModel {
    
    var id: String
    var playername: String
    var totalPoints: Int
    var image: URL?
    var cost: Double
    
    init(player: Info) {
        self.id = player.id
        self.playername = player.playername
        self.totalPoints = player.totalpoints
        self.cost = player.nowcost
        self.image = makeImageURL(player.image)
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: imageCode)
    }
    
}
