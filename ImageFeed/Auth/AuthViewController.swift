import UIKit

final class AuthViewController: UIViewController{
    let WebViewSegueIdentifier = "ShowWebView"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == WebViewSegueIdentifier{
            guard let webViewViewController = segue.destination as? WebViewViewController else{ fatalError("Failed to prepare for \(WebViewSegueIdentifier)")
            }
            webViewViewController.delegate = self
        }else{
            super.prepare(for: segue, sender: sender)
        }
    }
}

extension AuthViewController: WebViewViewControllerDelegate{
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
        //TODO: process code
    }
    
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        dismiss(animated: true)
    }
    
    
}
