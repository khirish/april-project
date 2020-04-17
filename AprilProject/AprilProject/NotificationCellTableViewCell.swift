//
//  NotificationCellTableViewCell.swift
//  AprilProject
//
//  Created by Khirish Meshram on 09/04/20.
//  Copyright © 2020 GumiViet. All rights reserved.
//

import UIKit

class NotificationCellTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationCellMessage: UILabel!
    @IBOutlet weak var notificationMessageHead: UILabel!
    @IBOutlet weak var notificationCellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
