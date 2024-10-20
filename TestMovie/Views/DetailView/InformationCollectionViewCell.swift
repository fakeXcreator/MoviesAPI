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
    var viewModel: DetailViewModel! {
        didSet {
            configureView()
        }
    }
    
    // MARK: - UI Components
    private lazy var imdbRatingLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var ratedLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var genresLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var countriesLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var languagesLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var starsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 14)
        return label
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
        self.addSubview(imdbRatingLabel)
        self.addSubview(ratedLabel)
        self.addSubview(genresLabel)
        self.addSubview(countriesLabel)
        self.addSubview(languagesLabel)
        self.addSubview(starsLabel)
    }
    
    // MARK: - Setup Constraints
    private func configureConstraints() {
        imdbRatingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        ratedLabel.snp.makeConstraints { make in
            make.top.equalTo(imdbRatingLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        genresLabel.snp.makeConstraints { make in
            make.top.equalTo(ratedLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        countriesLabel.snp.makeConstraints { make in
            make.top.equalTo(genresLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        languagesLabel.snp.makeConstraints { make in
            make.top.equalTo(countriesLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        starsLabel.snp.makeConstraints { make in
            make.top.equalTo(languagesLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imdbRatingLabel.text = nil
        ratedLabel.text = nil
        genresLabel.text = nil
        countriesLabel.text = nil
        languagesLabel.text = nil
        starsLabel.text = nil
    }
    
    // MARK: - Configure View
    public func configureView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            imdbRatingLabel.text = "IMDB Rating: \(viewModel.movie.imdbRating)"
            ratedLabel.text = "Rated: \(viewModel.movie.rated ?? "N/A")"
            genresLabel.text = "Genres: \(viewModel.movie.genres.joined(separator: ", "))"
            countriesLabel.text = "Countries: \(viewModel.movie.countries.joined(separator: ", "))"
            languagesLabel.text = "Languages: \(viewModel.movie.language.joined(separator: ", "))"
            starsLabel.text = "Stars: \(viewModel.movie.stars?.joined(separator: ", ") ?? "N/A")"
        }
    }
}
