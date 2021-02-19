//
//  CompanyCell.swift
//  CRUD
//
//  Created by Ramazan Abdullayev on 19.02.21.
//

import UIKit

class CompanyCell: UICollectionViewCell {
    
    var company: Company? {
        didSet {
            companyImage.image = company?.image
            companyName.text = company?.name
            companyDescription.text = company?.description
        }
    }
    
    private let companyImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "globe"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let companyName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let companyDescription: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 15
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 5
        layer.shadowOffset = .zero
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        addSubview(companyImage)
        addSubview(companyName)
        addSubview(companyDescription)
        
        NSLayoutConstraint.activate([
            companyImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            companyImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            companyImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            companyImage.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            companyName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            companyName.leadingAnchor.constraint(equalTo: companyImage.trailingAnchor, constant: 10),
            companyName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            companyDescription.topAnchor.constraint(equalTo: companyName.bottomAnchor),
            companyDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            companyDescription.leadingAnchor.constraint(equalTo: companyImage.trailingAnchor, constant: 10),
            companyDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
