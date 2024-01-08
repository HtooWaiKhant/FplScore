//
//  MainViewController.swift
//  Fpl
//
//  Created by Macbook on 12/22/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var viewModel: MainViewModel = MainViewModel()
    
    //variables:
    var cellDataSource: [PlayerTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        
        bindViewModel()
        
        
        // Do any additional setup after loading the view.
    }
    
    func configView() {
        self.title = "FPL"
        
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
    
    func bindViewModel() {
            viewModel.isLoading.bind { [weak self] isLoading in
                guard let self = self, let isLoading = isLoading else {
                    return
                }
                DispatchQueue.main.async {
                    if isLoading {
                        self.activityIndicator.startAnimating()
                    } else {
                        self.activityIndicator.stopAnimating()
                    }
                }
            }
            
        viewModel.cellDataSource.bind{ [weak self] data in
            guard let self = self, let data = data else {
                return
            }
            self.cellDataSource = data
            self.reloadTableView()
        }
        }

}
