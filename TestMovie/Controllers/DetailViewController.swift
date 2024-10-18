import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Variables
    private let dMovie: TrendingMoviesModel
    private var viewModel: DetailViewModel?
    private let detailView = DetailView()
    
    // MARK: - LifeCycle
    init(_ dMovie: TrendingMoviesModel) {
        self.dMovie = dMovie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchMovieDetails()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(detailView)
        detailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Fetch Movie Details
    private func fetchMovieDetails() {
        detailView.startLoading()

        let service = Service()
        service.fetchMovieDetails(movieId: dMovie.imdbID) { [weak self] result in
            DispatchQueue.main.async {
                self?.detailView.stopLoading()
                switch result {
                case .success(let data):
                    if let movieDetails = self?.parseMovieDetails(data: data) {
                        self?.viewModel = DetailViewModel(movie: movieDetails)
                        self?.detailView.viewModel = self?.viewModel
                        self?.detailView.collectionView?.reloadData()
                    } else {
                        print("Failed to parse movie details")
                        self?.showErrorAlert("Failed to parse movie details")
                    }
                case .failure(let error):
                    print("Error fetching movie details: \(error)")
                    self?.showErrorAlert("Error fetching movie details: \(error.localizedDescription)")
                }
            }
        }
    }

    private func showErrorAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    
    // MARK: - Parse Movie Details
    private func parseMovieDetails(data: Data) -> MovieDetailsModel? {
        let decoder = JSONDecoder()
        do {
            let movieDetails = try decoder.decode(MovieDetailsModel.self, from: data)
            return movieDetails
        } catch {
            print("Error parsing movie details: \(error)")
            return nil
        }
    }
}
