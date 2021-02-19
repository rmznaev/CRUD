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
    
    var companies = [Company]()
    var products = [Product]()
    
    let tableIdentifier = "tableCell"
    let collectionIdentifier = "collectionCell"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CompanyCell.self, forCellWithReuseIdentifier: collectionIdentifier)

        return collectionView
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductCell.self, forCellReuseIdentifier: tableIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
            
//        title = "Products"
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]
        
        createCompanies()
        createProducts()
        setUpCollectionView()
        setUpTableView()
    }
    
    private func createCompanies() {
        companies.append(Company(name: "Lyft",
                                 image: #imageLiteral(resourceName: "globe"),
                                 description: "Wherever you’re headed, let’s get there together."))
        companies.append(Company(name: "Uber",
                                 image: #imageLiteral(resourceName: "globe"),
                                 description: "Get in the driver's seat and get paid"))
        companies.append(Company(name: "Bolt",
                                 image: #imageLiteral(resourceName: "globe"),
                                 description: "Getmək üçün sürətli, əlverişli yol."))
    }
    
    private func createProducts() {
        products.append(Product(name: "Glasses",
                                image: #imageLiteral(resourceName: "globe"),
                                description: "Best glasses ever made!"))
        products.append(Product(name: "iPhone",
                                image: #imageLiteral(resourceName: "globe"),
                                description: "Best cellphone ever made!"))
        products.append(Product(name: "Computer",
                                image: #imageLiteral(resourceName: "globe"),
                                description: "Fast and smart!"))
    }
    
    private func setUpCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    private func setUpTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionIdentifier, for: indexPath) as! CompanyCell
        cell.company = companies[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 250, height: 150)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableIdentifier, for: indexPath) as! ProductCell
        cell.product = products[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
