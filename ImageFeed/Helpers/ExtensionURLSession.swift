import UIKit


extension URLSession {
    func objectTask<T:Decodable>(for request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionTask {
        let fulfillCompletion: (Result<T, Error>) -> Void = { result in
            DispatchQueue.main.async {
                 completion(result)
            }
        }
        let task = dataTask(with: request) { data, response, error in
            if let data = data, let response = response as? HTTPURLResponse {
                if 200..<300 ~= response.statusCode {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let decodedModel = try jsonDecoder.decode(T.self, from: data)
                        fulfillCompletion(.success(decodedModel))
                    } catch {
                        fulfillCompletion(.failure(NetworkError.decodingError))
                    }
                } else {
                    fulfillCompletion(.failure(NetworkError.httpStatusCode(response.statusCode)))
                }
            } else if let error {
                fulfillCompletion(.failure(NetworkError.urlRequestError(error)))
            } else {
                fulfillCompletion(.failure(NetworkError.urlSessionError))
            }
        }
        task.resume()
        return task
    }
}
