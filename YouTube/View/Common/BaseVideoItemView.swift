//
//  BaseVideoItemView.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/07.
//

import UIKit

class BaseVideoItemView: BaseViewForXib {

    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
