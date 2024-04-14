//
//  AccountViewController.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/5/24.
//

import UIKit

final class AccountViewController: UIViewController {

    @IBOutlet private weak var profileView: UIView!
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var themeVIew: UIView!
    @IBOutlet private weak var themeTitle: UILabel!
    @IBOutlet private weak var themeValue: UILabel!
    @IBOutlet private weak var themeButton: UIButton!
    @IBOutlet private weak var languageView: UIView!
    @IBOutlet private weak var languageTitle: UILabel!
    @IBOutlet private weak var languageValue: UILabel!
    @IBOutlet private weak var languageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        profileView.layer.cornerRadius = 12
        themeVIew.layer.cornerRadius = 12
        languageView.layer.cornerRadius = 12
        profileImage.layer.cornerRadius = 28
    }
    
    
    @IBAction func tappedThemeButton(_ sender: Any) {
        
    }
    
    @IBAction func tappedLanguageButton(_ sender: Any) {
    }
}
