import UIKit

final class DetailViewController: UIViewController {
    
    private let viewModel: DetailViewModel
    
    private let detailView: DetailView
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        self.detailView = DetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureConstraints()
        detailView.collectionView?.delegate = self
        detailView.collectionView?.dataSource = self
    }
    
    private func setupUI() {
        title = viewModel.title
        view.backgroundColor = .systemBackground
        view.addSubview(detailView)
    }
    
    private func configureConstraints() {
        detailView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = viewModel.sections[indexPath.section]
        switch sectionType {
        case .header(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCollectionViewCell.identifier, for: indexPath) as? HeaderCollectionViewCell else { fatalError() }
            cell.configureView()
            return cell
        case .description(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DescriptionCollectionViewCell.identifier, for: indexPath) as? DescriptionCollectionViewCell else { fatalError() }
            cell.configureView()
            return cell
        case .information(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InformationCollectionViewCell.identifier, for: indexPath) as? InformationCollectionViewCell else { fatalError() }
            cell.configureView()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            fatalError("Unexpected element kind")
        }

        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as? SectionHeader else {
            fatalError("Cannot dequeue section header")
        }

        let sectionType = viewModel.sections[indexPath.section]
        let sectionTitle: String

        switch sectionType {
        case .header:
            sectionTitle = "Header"
        case .description:
            sectionTitle = "Description"
        case .information:
            sectionTitle = "Information"
        }
        sectionHeader.configureSectionCell(label: sectionTitle.capitalized)
        return sectionHeader
    }
    
}
