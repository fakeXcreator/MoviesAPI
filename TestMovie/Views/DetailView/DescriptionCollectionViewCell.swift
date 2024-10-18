//
//  DescriptionCollectionViewCell.swift
//  TestMovie
//
//  Created by Daniil Kim on 18.10.2024.
//

import UIKit

class DescriptionCollectionViewCell: UICollectionViewCell {
    static let identifier = "DescriptionCollectionViewCell"
    
    // MARK: - Variables
    
    // MARK: - UI Components
    private let descriptionTextView: UITextView = {
        let descriptionTextView = UITextView()
        descriptionTextView.textColor = UIColor.label
        descriptionTextView.alpha = 0.6
        descriptionTextView.isEditable = false
        descriptionTextView.backgroundColor = .clear
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.showsVerticalScrollIndicator = false
        descriptionTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        descriptionTextView.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return descriptionTextView
    }()
    
    private lazy var taglineLabel: UILabel = {
        let taglineLabel = UILabel()
        taglineLabel.text = ""
        taglineLabel.textColor = UIColor.label
        taglineLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return taglineLabel
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
    
    public func configure(with viewModel: DescriptionViewModel) {
        self.taglineLabel.text = viewModel.tagline
        self.descriptionTextView.text = viewModel.description
    }

    
    // MARK: - Setup Views
    private func setupUI() {
        self.addSubview(taglineLabel)
        self.addSubview(descriptionTextView)
    }
    
    // MARK: - Setup Constraints
    private func configureConstraints() {
        descriptionTextView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(130)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        taglineLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionTextView.snp.bottom)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
    }
}


