//
//  LoginViewController.swift
//  Elastic
//
//  Created by HienSiGa on 3/8/19.
//  Copyright © 2019 HSG. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {

    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        GIDSignIn.sharedInstance().signInSilently()
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    @IBAction func tapGoogleSignIn(_ sender: Any) {
        print("> tapGoogleSignIn")
    }
}

extension LoginViewController: GIDSignInUIDelegate {
    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error?) {
//        myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}
