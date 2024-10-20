//
//  DetailViewModel.swift
//  TestMovie
//
//  Created by Daniil Kim on 18.10.2024.
//

import Foundation
import UIKit

enum SectionType {
    case header(viewModel: HeaderViewModel)
    case description(viewModel: DescriptionViewModel)
    case information(viewModel: InformationViewModel)
}

final class DetailViewModel {
    let movie: MovieDetailsModel
    var sections: [SectionType] = []
    
    init(movie: MovieDetailsModel) {
        self.movie = movie
        setupSections()
    }
    
    private func setupSections() {
        let headerViewModel = HeaderViewModel(movie: movie)
        let descriptionViewModel = DescriptionViewModel(movie: movie)
        let informationViewModel = InformationViewModel(movie: movie)

        sections.append(.header(viewModel: headerViewModel))
        sections.append(.description(viewModel: descriptionViewModel))
        sections.append(.information(viewModel: informationViewModel))
    }
    
    public var title: String? {
        movie.title
    }
    
    func createHeaderSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [createHeaderItem()]
        return section
    }
    
    func createDescriptionSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(200))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
    
    func createInformationSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(150))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
    
    func createHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                            heightDimension: .absolute(10))
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size,
                                                           elementKind: UICollectionView.elementKindSectionHeader,
                                                           alignment: .top)
    }
}
