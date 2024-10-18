//
//  MovieCell.swift
//  TestMovie
//
//  Created by Daniil Kim on 18.10.2024.
//

import UIKit
import SnapKit

class MovieCell: UITableViewCell {
    
    static let identifier = "MovieCell"
    
    // MARK: - Variables
    private(set) var movie: TrendingMoviesModel!
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with movie: TrendingMoviesModel) {
        self.movie = movie
        
        self.titleLabel.text = movie.title
        self.yearLabel.text = movie.year
    }
    
    // MARK: - UI Components
    private let movieLogo: UIImageView = {
        let movieLogo = UIImageView()
        movieLogo.contentMode = .scaleAspectFit
        movieLogo.image = UIImage(systemName: "popcorn.fill")
        movieLogo.tintColor = .label
        return movieLogo
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = ""
        titleLabel.textColor = UIColor.label
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return titleLabel
    }()
    
    private lazy var yearLabel: UILabel = {
        let yearLabel = UILabel()
        yearLabel.text = ""
        yearLabel.textColor = UIColor.label
        yearLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return yearLabel
    }()
    
    // MARK: - Setup Views
    private func setupUI() {
        self.addSubview(movieLogo)
        self.addSubview(titleLabel)
        self.addSubview(yearLabel)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        movieLogo.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalTo(contentView).inset(20)
            make.width.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalTo(movieLogo.snp.trailing).offset(20)
            make.trailing.equalTo(contentView).inset(20)
        }
        
        yearLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(movieLogo.snp.trailing).offset(20)
            make.trailing.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }
}
