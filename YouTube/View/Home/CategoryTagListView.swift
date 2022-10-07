//
//  CategoryTagListView.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/09/28.
//

import UIKit

class CategoryTagListView: BaseViewForXib {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tagListContainer: UIView!
    @IBOutlet weak var sendOpinionButton: UIButton!
    
    private let tagList: [String] = ["전체", "게임", "실시간", "음악", "믹스", "액션 어드벤쳐 게임", "요리", "최근 업로드 영상", "감상한 동영상", "게시물", "새로운 맞춤 동영상"]
    private let tagSpacing: CGFloat = 10
    
    override func commonInit() {
        super.commonInit()
        updateTagList()
    }
    
    private func updateTagList() {
        var prevView: UIButton?
        let tagLastIndex = tagList.count - 1
        setEmptyTagList()
        for (i, tag) in tagList.enumerated() {
            let tagButton = UIButton()
            tagButton.setTitle(tag, for: .normal)
            tagButton.setTitleColor(.label, for: .normal)
            tagButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
            tagButton.backgroundColor = .secondarySystemFill
            tagButton.layer.cornerRadius = self.frame.height/2
            tagButton.clipsToBounds = true
            tagButton.sizeToFit()
            tagButton.borderColor = .tertiarySystemFill
            tagButton.borderWidth = 1
            tagButton.cornerRadius = tagButton.frame.height/2
            
            tagListContainer.addSubview(tagButton)
            tagButton.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(tagButton.frame.width + 20)
                if let prevView = prevView {
                    make.leading.equalTo(prevView.snp.trailing).offset(tagSpacing)
                } else {
                    make.leading.equalToSuperview()
                }
                
                if tagLastIndex == i {
                    make.trailing.equalToSuperview()
                }
            }
            prevView = tagButton
        }
    }
    
    private func setEmptyTagList() {
        for subView in tagListContainer.subviews {
            subView.removeFromSuperview()
        }
    }
}
