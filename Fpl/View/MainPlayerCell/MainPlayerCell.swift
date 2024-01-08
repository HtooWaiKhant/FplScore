//
//  MainPlayerCell.swift
//  Fpl
//
//  Created by Macbook on 12/23/23.
//

import UIKit
import SDWebImage

class MainPlayerCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var playerImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var totalPointsLabel: UILabel!
    
    
    
    public static var indentifier: String {
        get {
            return  "MainPlayerCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainPlayerCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //backView.addBorder(color: .label, width: 1)
        backView.round()
        
        playerImageView.round(5)
    }
    
    func setupCell(viewModel: PlayerTableCellViewModel) {
        self.nameLabel.text = viewModel.playername
        self.totalPointsLabel.text = String(viewModel.totalPoints)
        self.costLabel.text = String(viewModel.cost)
        self.playerImageView.sd_setImage(with: viewModel.image)
    }
}
