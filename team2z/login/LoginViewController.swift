//
//  LoginViewController.swift
//  team2z
//
//  Created by 정인호 on 02/03/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import GoogleSignIn

protocol LoginModalDelegate {
    func didContinueAction()
}

class LoginViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var disconnectButton: UIButton!
    @IBOutlet weak var statusText: UILabel!
    
    var loginModalDelegate: LoginModalDelegate?
    var isModallyPresented = false
//    var window: UIWindow?
    private lazy var baseViewController = {
        BaseViewController()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "로그인"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        
        // Initialize sign-in
        GIDSignIn.sharedInstance().clientID = "734417615000-phtc5nkia4tdn7b30pt5k8sci9u9ospp.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            // Signed in And (todo: 앱에 처음 접속한 사람이 아니라면)
            goToBaseView()
            return
        }
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(LoginViewController.receiveToggleAuthUINotification(_:)),
                                               name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
                                               object: nil)
        
        statusText.text = "Initialized Swift app..."
        toggleAuthUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            // Signed in And (todo: 앱에 처음 접속한 사람이 아니라면)
            print("이미 로그인 했네요.")
        }
    }
    
    func makeBackButton() -> UIButton {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "left_arrow.png"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }
    
    @objc func backButtonPressed() {
        //        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func skipButtonPressed(_ sender: UIButton) {
        goToBaseView()
    }
    
    private func goToBaseView() {
        if isModallyPresented {
            loginModalDelegate?.didContinueAction()
        } else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window!.rootViewController = baseViewController
            
        }
    }
    @IBAction func didTabSignIn(_ sender: GIDSignInButton) {
        print("test")
    }
    
    @IBAction func didTabSignOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        statusText.text = "Signed out."
        toggleAuthUI()
    }
    
    @IBAction func didTabDisconnect(_ sender: UIButton) {
        GIDSignIn.sharedInstance().disconnect()
        // [START_EXCLUDE silent]
        statusText.text = "Disconnecting."
        // [END_EXCLUDE]
    }
    
    func toggleAuthUI() {
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            // Signed in
            signInButton.isHidden = true
            signOutButton.isHidden = false
            disconnectButton.isHidden = false
        } else {
            signInButton.isHidden = false
            signOutButton.isHidden = true
            disconnectButton.isHidden = true
            statusText.text = "Google Sign in\niOS Demo"
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
                                                  object: nil)
    }
    
    @objc func receiveToggleAuthUINotification(_ notification: NSNotification) {
        if notification.name.rawValue == "ToggleAuthUINotification" {
            self.toggleAuthUI()
            if notification.userInfo != nil {
                guard let userInfo = notification.userInfo as? [String:String] else { return }
                self.statusText.text = userInfo["statusText"]!
            }
        }
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        print("inWillDispatch")
    }
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        print("signIn present")
    }
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        print("signIn dismiss")
    }

}

extension LoginViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            print(appDelegate.window!.rootViewController as Any)
            appDelegate.window!.rootViewController = baseViewController
            
            // 로그인 성공 후 서버로 idToken을 보내서 유효성을 검증한 후,
            // 유저의 정보를 받아온다.
            // 만약, 소셜 로그인을 처음 한 유저라면(닉네임이 존재하지 않는 다면) 닉네임 설정 페이지로 이동시킨다.
        }
    }
    
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
        print("sign... didDisconnectWith...")
    }
}
