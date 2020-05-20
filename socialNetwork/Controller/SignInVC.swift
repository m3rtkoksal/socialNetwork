//
//  SignInVC.swift
//  socialNetwork
//
//  Created by Mert Köksal on 15.05.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: FancyField!
    @IBOutlet weak var passwordTextField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        let fbLoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
               if let error = error {
                   print("Failed to login: \(error.localizedDescription)")
                   return
               }
               
            guard let accessToken = AccessToken.current else {
                   print("Failed to get access token")
                   return
               }
        
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
               
            self.firebaseAuth(credential)
               // Perform login by calling Firebase APIs
            
        
           }   
    
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
            
            // Present the main view
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") {
                UIApplication.shared.keyWindow?.rootViewController = viewController
                self.dismiss(animated: true, completion: nil)
            }
            
        })
    }
    
    @IBAction func signInPressed(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    print("Able to auth with firebase email")
                } else {
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            print("Unable to auth with firebase email")
                        } else {
                            print("Successfully auth with firebase email")
                        }
                    }
                }
            }
        }
        
    }
    

}
