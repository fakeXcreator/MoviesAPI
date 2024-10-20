import UIKit

final class DetailView: UIView {
    private let viewModel: DetailViewModel
    
    var collectionView: UICollectionView?
    

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    init(frame: CGRect, viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupUI()
        configureConstraints()
    }
    
    // MARK: -  Setup UI
    private func setupUI() {
        backgroundColor = .systemPurple
        let collectionView = createCollectionView()
        self.collectionView = collectionView
        addSubview(collectionView)
        addSubview(spinner)
    }
    
    // MARK: -  Setup constraints
    private func configureConstraints() {
        guard let collectionView = collectionView else {
            return
        }

        spinner.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.center.equalToSuperview()
        }

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HeaderCollectionViewCell.self, forCellWithReuseIdentifier: HeaderCollectionViewCell.identifier)
        collectionView.register(DescriptionCollectionViewCell.self, forCellWithReuseIdentifier: DescriptionCollectionViewCell.identifier)
        collectionView.register(InformationCollectionViewCell.self, forCellWithReuseIdentifier: InformationCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }
    
    private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {
        let section: NSCollectionLayoutSection
        let sectionTypes = viewModel.sections
        
        switch sectionTypes[sectionIndex] {
        case .header:
            section = viewModel.createHeaderSection()
        case .description:
            section = viewModel.createDescriptionSection()
        case .information:
            section = viewModel.createInformationSection()
        }
        
        if sectionIndex != 0 {
            section.boundarySupplementaryItems = [viewModel.createHeaderItem()]
        }
        return section
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
