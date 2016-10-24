//
//  ViewController.swift
//  FacebookSDKSwift
//
//  Created by Edgar Allan Glez on 10/16/16.
//  Copyright © 2016 Edgar Allan Glez. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        // Handle clicks on the button
//        loginButton.addTarget(self, action: @selector(self.loginButtonClicked) forControlEvents: .TouchUpInside)

        if let accessToken = AccessToken.current {
            // User is logged in, use 'accessToken' here.
        }
        
        view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Once the button is clicked, show the login dialog
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
            }
        }
    }

}

