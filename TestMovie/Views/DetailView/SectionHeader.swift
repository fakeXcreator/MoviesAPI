//
//  SectionHeader.swift
//  TestMovie
//
//  Created by Daniil Kim on 18.10.2024.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let identifier = "TopAnimeSectionHeader"
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        addSubview(label)
    }
    
    private func configureConstraints() {
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
    public func configureSectionCell(label: String) {
        self.label.text = label
    }
}

