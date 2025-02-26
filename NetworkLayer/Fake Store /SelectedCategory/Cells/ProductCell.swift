//
//  ProductCell.swift
//  NetworkLayer
//
//  Created by RAJEEV MAHAJAN on 26/02/25.
//

import UIKit

class ProductCell: UITableViewCell {

    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 3
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let reuseIdentifier = "ProductCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productImageView.widthAnchor.constraint(equalToConstant: 80),
            productImageView.heightAnchor.constraint(equalToConstant: 80),

            titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
         
            priceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),

            categoryLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 10),
            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = "₹\(product.price)"
        categoryLabel.text = product.category
        descriptionLabel.text = product.description
        
        // Load image asynchronously (assuming the image is a URL)
        if let url = URL(string: product.image) {
            loadImage(from: url)
        }
    }
    
    // Helper function to load the image asynchronously
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.productImageView.image = image
            }
        }.resume()
    }
}
