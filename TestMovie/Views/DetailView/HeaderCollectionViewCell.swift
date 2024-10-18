//
//  HeaderCollectionViewCell.swift
//  TestMovie
//
//  Created by Daniil Kim on 18.10.2024.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    static let identifier = "HeaderCollectionViewCell"
    
    // MARK: - Variables
    
    // MARK: - UI Components
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = ""
        titleLabel.textColor = UIColor.label
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return titleLabel
    }()
    
    private lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.text = ""
        dateLabel.textColor = UIColor.label
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return dateLabel
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: HeaderViewModel) {
        self.titleLabel.text = viewModel.title
        self.dateLabel.text = viewModel.releaseDate
    }

    
    // MARK: - Setup Views
    private func setupUI() {
        self.addSubview(titleLabel)
        self.addSubview(dateLabel)
    }
    
    // MARK: - Setup Constraints
    private func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(-16)
            make.centerX.equalTo(titleLabel)
            make.width.equalTo(titleLabel)
        }
    }
}
