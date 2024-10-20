import Foundation

class Service {

    private let headers = [
        "x-rapidapi-key": "eeeba91139msh48ee3837c171ee8p16b9ffjsnee09eeeb2c36",
        "x-rapidapi-host": "movies-tv-shows-database.p.rapidapi.com",
        "Type": "get-movie-details"
    ]
    
    private let baseURL = "https://movies-tv-shows-database.p.rapidapi.com"
    private let baseURL1 = "https://movies-tv-shows-database.p.rapidapi.com"


    func fetchTrendingMovies(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/?page=1") else {
            completion(.failure(NSError(domain: "InvalidURL", code: -1, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                let error = NSError(domain: "NetworkError", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Unexpected response status: \(statusCode)"])
                completion(.failure(error))
                return
            }
            print(try! JSONSerialization.jsonObject(with: data!, options: []))
            guard let data = data else {
                let error = NSError(domain: "DataError", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data returned"])
                completion(.failure(error))
                return
            }
            
            completion(.success(data))
        }

        dataTask.resume()
    }

    func fetchMovieDetails(movieId: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/?movieid=\(movieId)") else {
            completion(.failure(NSError(domain: "InvalidURL", code: -1, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching movie details: \(error)")
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = NSError(domain: "ResponseError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
                completion(.failure(error))
                return
            }

            // Log the status code
            print("Movie Details Response Status Code: \(httpResponse.statusCode)")

            guard (200...299).contains(httpResponse.statusCode) else {
                let statusCode = httpResponse.statusCode
                let error = NSError(domain: "NetworkError", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Unexpected response status: \(statusCode)"])
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "DataError", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data returned"])
                completion(.failure(error))
                return
            }
            
            // Log the raw data
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON Response: \(jsonString)")
            }
            
            completion(.success(data))
        }

        dataTask.resume()
    }

}
