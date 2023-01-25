//
//  EmployessVC.swift
//  ClickJobs_NewProject
//
//  Created by Sherzod on 25/03/22.
//

import UIKit

class EmployessVC: UIViewController {
    
    @IBOutlet var filterBtn: UIButton!
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "EmployessTVC", bundle: nil), forCellReuseIdentifier: "EmployessTVC")
            tableView.backgroundColor = .defaultGray
            tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 10, right: 0)
        }
    }
    
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .defaultGray
        setupNavBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension EmployessVC {
    
    private func setupNavBar() {
        
        let offset = -(searchController.searchBar.frame.height)
        tableView.setContentOffset(CGPoint(x: 0, y: offset), animated: false)
        navigationController?.navigationBar.prefersLargeTitles = false
        
        
        navigationItem.title = "Employees"
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search job-seekers"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.backBarButtonItem?.tintColor = .red
        
    }
}

extension EmployessVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmployessTVC", for: indexPath) as? EmployessTVC else { return UITableViewCell() }
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EmployessDetailVC(nibName: "EmployessDetailVC", bundle: nil)

        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if searchController.isActive {
            self.filterBtn.isHidden = true
        } else {
            self.filterBtn.isHidden = false
        }
        self.navigationController?.navigationBar.barTintColor = .defaultGray
    }
    
    
}



