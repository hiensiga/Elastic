//
//  MessageTableViewCell.swift
//  Elastic
//
//  Created by Doan Phuc Hien on 12/10/18.
//  Copyright © 2018 HSG. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var imvAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.showAnimation()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showAnimation() {
        [lblName, lblDate, lblContent].forEach { $0?.showAnimatedSkeleton() }
        imvAvatar.showAnimatedSkeleton()
    }

    func hideAnimation() {
        [lblName, lblDate, lblContent].forEach { $0?.hideSkeleton() }
        imvAvatar.hideSkeleton()
    }
}
