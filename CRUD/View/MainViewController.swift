//
//  MainViewController.swift
//  CRUD
//
//  Created by Ramazan Abdullayev on 18.02.21.
//

import UIKit
import Foundation

class MainViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    var products = [Product]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductCell.self, forCellReuseIdentifier: "cell")

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        safeArea = view.layoutMarginsGuide
            
        title = "Products"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]
        
        createProducts()
        setUpTableView()
    }
    
    private func createProducts() {
        products.append(Product(name: "Glasses",
                                image: nil,
                                description: "Best glasses ever made!"))
        products.append(Product(name: "iPhone",
                                image: nil,
                                description: "Best cellphone ever made!"))
        products.append(Product(name: "Computer",
                                image: nil,
                                description: "Fast and smart!"))
    }
    
    private func setUpTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductCell
        cell.product = products[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
