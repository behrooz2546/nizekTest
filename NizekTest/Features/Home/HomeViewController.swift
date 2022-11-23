//
//  HomeViewController.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var forgroundTimer: Timer?
    var durationForgroundActive: Double = 0.0

    
    static func show(navigationController: UINavigationController?) {
        let vc = HomeViewController()
        let new = UINavigationController(rootViewController: vc)
        new.modalPresentationStyle = .fullScreen
        navigationController?.present(new, animated: true)
    }
    
    var contentView: HomeView {
        return view as! HomeView
    }
    
    override func loadView() {
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgroundTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireForgroundTimer), userInfo: nil, repeats: true)
        durationForgroundActive = 0
        
        contentView.logoutButton.addTarget(self, action: #selector(handleLogoutButtonTapped), for: .touchUpInside)
        
        let fullname = SharedPreferencesUtils.shared.getFullname()
        contentView.fullnameLabel.text = "Welcome \(fullname ?? "")"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        debugPrint("viewWillAppear")
        durationForgroundActive = 0
    }
    
    
    
    //MARK: - Actions
    @objc func handleLogoutButtonTapped() {
        debugPrint("logoutButtonTapped")
        
        SignUpViewController.show(navigationController: self.navigationController, push: false)
        
        SharedPreferencesUtils.shared.logout()
        resetTimer()
        invalidateTimer()
    }
    
    @objc func fireForgroundTimer() {
        durationForgroundActive += 1
        debugPrint(durationForgroundActive)
        if (durationForgroundActive > Constants.maxDurationForgroundActiveTime) {
            // logout session
            SharedPreferencesUtils.shared.logout()
            
            resetTimer()
            invalidateTimer()
            
            // show Login View Controller
            LoginViewController.show(navigationController: self.navigationController, push: false)
        }
    }
    
    func resetTimer() {
        durationForgroundActive = 0
        
    }
    
    func invalidateTimer() {
        forgroundTimer?.invalidate()
    }
}
