//
//  ViewController.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/16/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    //MARK : variables
    fileprivate let detailsSegue = "showDetails"
    private let refreshItemsControl = UIRefreshControl()
    fileprivate let tableInsets = UIEdgeInsets(top: 4, left: 24, bottom: 0, right: 24)
    private let dataSource = ItemsListDataSource()
    
    lazy var viewModel : ItemsListViewModel = {
        let viewModel = ItemsListViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Items list"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        setupTableView()
        
        dataSource.data.addAndNotify(observer: self) { [weak self] in
            guard let self = self else {
                return
            }
            
            self.refreshItemsControl.endRefreshing()
            
            // 1
            self.tableView.reloadData()
        }
        
        viewModel.fetchItems()
    }

    private func setupTableView() {
        
        // Add Refresh Control to Table View
        
        tableView.separatorInset = tableInsets
        tableView.backgroundColor = .orange
        //setting up the flexible cell height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        //removing empty cells
        tableView.tableFooterView = UIView.init()
        tableView.layoutMargins = .zero
        tableView.register(ItemTableViewCell.nibCell, forCellReuseIdentifier: ItemTableViewCell.identifierCell)
        
        tableView.dataSource = dataSource
        tableView.refreshControl = refreshItemsControl
        
        // Configure Refresh Control
        refreshItemsControl.addTarget(self, action: #selector(refreshItemsData(_:)), for: .valueChanged)
        
    }
    
    @objc private func refreshItemsData(_ sender: Any) {
        // Fetch Videos Data
        viewModel.fetchItems()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //open the details screen
        performSegue(withIdentifier: detailsSegue, sender: dataSource.data.value[indexPath.row])
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == detailsSegue {
            //prepare the Details&Open
            guard let detailsViewController = segue.destination as? DetailsViewController,
                  let selectedItem = sender as? Item else {
                    print("unable to open details")
                    return
            }
            
            detailsViewController.item = selectedItem
            
        }
    }
}
