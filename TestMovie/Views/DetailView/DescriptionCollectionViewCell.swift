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
    var viewModel: DetailViewModel! {
        didSet {
            configureView()
        }
    }
    
    // MARK: - UI Components
    private lazy var taglineLabel: UILabel = {
        let taglineLabel = UILabel()
        taglineLabel.text = ""
        taglineLabel.textColor = UIColor.label
        taglineLabel.font = UIFont.italicSystemFont(ofSize: 14)
        return taglineLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = ""
        descriptionLabel.textColor = UIColor.label
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0 // Allow for multiple lines
        return descriptionLabel
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
    
    // MARK: - Setup Views
    private func setupUI() {
        self.addSubview(taglineLabel)
        self.addSubview(descriptionLabel)
    }
    
    // MARK: - Setup Constraints
    private func configureConstraints() {
        taglineLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(taglineLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        taglineLabel.text = nil
        descriptionLabel.text = nil
    }
    
    // MARK: - Configure View
    public func configureView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            taglineLabel.text = "Tagline: \(viewModel.movie.tagline ?? "N/A")"
            descriptionLabel.text = viewModel.movie.description
        }
    }
}
