import Foundation

final class OAuth2TokenStorage {
    var token: String?
    private static let tokenKey = "BearerToken"
    
    static var token: String? {
        get {
            return UserDefaults.standard.string(forKey: tokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: tokenKey)
        }
    }
}
