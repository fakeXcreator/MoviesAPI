import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    private var viewModel: MoviesViewModel!

    // MARK: - UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
        return tableView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupConstraints()
        
        let service = Service()
        viewModel = MoviesViewModel(service: service)
                viewModel.didUpdateMovies = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.fetchTrendingMovies()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.navigationItem.title = "Trending Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Constraints Setup
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}

// MARK: - TableView Functions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
            fatalError("Unable to dequeue MovieCell in ViewController")
        }
        
        let movie = viewModel.movie(at: indexPath.row)
        cell.configure(with: movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            // Retrieve the selected movie
            let selectedMovie = viewModel.movie(at: indexPath.row)
            
            // Fetch or convert selectedMovie into MovieDetailsModel
            fetchMovieDetails(for: selectedMovie) { [weak self] movieDetails in
                // Create a DetailViewModel from the detailed movie info
                let detailViewModel = DetailViewModel(movie: movieDetails)
                
                // Pass the DetailViewModel to the DetailViewController
                let detailVC = DetailViewController(viewModel: detailViewModel)
                
                // Push the DetailViewController onto the navigation stack
                self?.navigationController?.pushViewController(detailVC, animated: true)
            }
        }
        
        // Function to fetch detailed movie data using the selected movie's ID
        func fetchMovieDetails(for movie: TrendingMoviesModel, completion: @escaping (MovieDetailsModel) -> Void) {
            let service = Service()
            
            service.fetchMovieDetails(movieId: movie.imdbID) { result in
                switch result {
                case .success(let data):
                    // Parse the data into MovieDetailsModel
                    if let movieDetails = self.parseMovieDetails(data: data) {
                        completion(movieDetails) // Pass the details to the completion handler
                    }
                case .failure(let error):
                    print("Error fetching movie details: \(error)")
                }
            }
        }
        
        // Parsing function for movie details
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
