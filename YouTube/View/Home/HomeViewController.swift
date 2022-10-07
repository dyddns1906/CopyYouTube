//
//  HomeViewController.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/09/27.
//

import UIKit

class HomeViewController: TabBaseViewController {

    @IBOutlet weak var tagListViewContainer: UIView!
    
    private let tagListView = CategoryTagListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupTagListView()
    }
    
    private func setupTagListView() {
        tagListViewContainer.addSubview(tagListView)
        tagListView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
