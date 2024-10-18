//
//  InformationCollectionViewCell.swift
//  TestMovie
//
//  Created by Daniil Kim on 18.10.2024.
//

import UIKit

class InformationCollectionViewCell: UICollectionViewCell {
    static let identifier = "InformationCollectionViewCell"
    
    // MARK: - Variables
    
    private let ratingLabel: UILabel = {
        let ratingLabel = UILabel()
        ratingLabel.textColor = .label
        ratingLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        ratingLabel.textAlignment = .left
        return ratingLabel
    }()
    
    private let rateLabel: UILabel = {
        let rateLabel = UILabel()
        rateLabel.textColor = .label
        rateLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        rateLabel.textAlignment = .left
        return rateLabel
    }()
    
    private let genresLabel: UILabel = {
        let genresLabel = UILabel()
        genresLabel.textColor = .label
        genresLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        genresLabel.textAlignment = .left
        return genresLabel
    }()
    
    private let countriesLabel: UILabel = {
        let countriesLabel = UILabel()
        countriesLabel.textColor = .label
        countriesLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        countriesLabel.textAlignment = .left
        return countriesLabel
    }()
    
    private let languagesLabel: UILabel = {
        let languagesLabel = UILabel()
        languagesLabel.textColor = .label
        languagesLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        languagesLabel.textAlignment = .left
        return languagesLabel
    }()
    
    private let starsLabel: UILabel = {
        let starsLabel = UILabel()
        starsLabel.textColor = .label
        starsLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        starsLabel.textAlignment = .left
        return starsLabel
    }()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: InformationViewModel) {
        self.ratingLabel.text = viewModel.imdbRating
        self.rateLabel.text = viewModel.rated
        self.genresLabel.text = viewModel.genres
        self.countriesLabel.text = viewModel.countries
        self.languagesLabel.text = viewModel.languages
        self.starsLabel.text = viewModel.stars
    }
    
    private func setupUI() {
        self.addSubview(ratingLabel)
        self.addSubview(rateLabel)
        self.addSubview(genresLabel)
        self.addSubview(countriesLabel)
        self.addSubview(languagesLabel)
        self.addSubview(starsLabel)
    }
    
    private func configureConstraints() {
        ratingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(ratingLabel.snp.bottom).offset(3)
            make.leading.equalTo(ratingLabel)
            make.trailing.equalTo(ratingLabel)
        }
        
        genresLabel.snp.makeConstraints { make in
            make.top.equalTo(rateLabel.snp.bottom).offset(3)
            make.leading.equalTo(rateLabel)
            make.trailing.equalTo(rateLabel)
        }
        
        countriesLabel.snp.makeConstraints { make in
            make.top.equalTo(genresLabel.snp.bottom).offset(3)
            make.leading.equalTo(rateLabel)
            make.trailing.equalTo(rateLabel)
        }
        
        languagesLabel.snp.makeConstraints { make in
            make.top.equalTo(countriesLabel.snp.bottom).offset(3)
            make.leading.equalTo(rateLabel)
            make.trailing.equalTo(rateLabel)
        }
        
        starsLabel.snp.makeConstraints { make in
            make.top.equalTo(languagesLabel.snp.bottom).offset(3)
            make.leading.equalTo(rateLabel)
            make.trailing.equalTo(rateLabel)
        }
    }
}
