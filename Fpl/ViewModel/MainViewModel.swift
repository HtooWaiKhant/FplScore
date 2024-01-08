//
//  MainViewModel.swift
//  Fpl
//
//  Created by Macbook on 12/23/23.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[PlayerTableCellViewModel]> = Observable(nil)
    var dataSource: PlayerModel?
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.data.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        
        APICaller.getPlayerScores { [weak self] data in
            self?.isLoading.value = false
            
            switch data {
            case .success(let data):
                print("Top player score: \(data.data.count)")
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.data.compactMap({
            PlayerTableCellViewModel(player: $0)
        })
    }
    
    
}
