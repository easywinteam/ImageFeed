import Foundation

final class ProfileService{
    private(set) var profile: Profile?
    private var fetchProfileTask: URLSessionTask?
    private let urlSession = URLSession.shared
    
    func fetchProfile(_ token: String, completion: @escaping (Result<Profile, Error>) -> Void){
        fetchProfileTask?.cancel()
        
        var request = URLRequest(url: ProfileURL)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        fetchProfileTask = urlSession.objectTask(for: request){[weak self] (result: Result<ProfileResult, Error>) in
            switch result {
            case .success(let profileResult):
                let profile = Profile(
                    userName: profileResult.userName,
                    name: "\(profileResult.firstName) \(profileResult.lastName)",
                    loginName: "@\(profileResult.userName)",
                    bio: profileResult.bio)
                self?.profile = profile
                completion(.success(profile))
            case .failure(_):
                completion(.failure(ProfileServiceError.decodingFailed))
            }
        }
        fetchProfileTask?.resume()
    }
}

struct ProfileResult: Codable{
    let userName: String
    let firstName: String
    let lastName: String
    let bio: String?
    
    //Определяем свойства структуры, которые соответствуют полям ответа сервера.
    enum CodingKeys: String, CodingKey{
        case userName = "username"
        case firstName = "first_name"
        case lastName = "last_name"
        case bio = "bio"
    }
}

struct Profile: Codable{
    let userName: String
    let name: String
    let loginName: String
    let bio: String?
}

enum ProfileServiceError: Error{
    case invalidURL
    case invalidData
    case decodingFailed
}
