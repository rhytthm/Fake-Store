//
//  SelectedCategoryVC.swift
//  NetworkLayer
//
//  Created by RAJEEV MAHAJAN on 26/02/25.
//

import UIKit

class SelectedCategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let viewModel = SelectedCategoryVM()
    var productcategory: String
    let tableView =  UITableView()
    
    init(for product: String) {
        self.productcategory = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getProducts(for: productcategory)
        registerCells()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func registerCells() {
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseIdentifier, for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel.products[indexPath.row])
        return cell
    }
    
}

extension SelectedCategoryVC: SelectedCategoryVCProtocol{
    func productsReceived() {
        tableView.reloadData()
    }
}
