//
//  postedTableCell.swift
//  snapChatProject
//
//  Created by Jimmy on 3/9/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class postedTableCell: UITableViewCell {

    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var indicator: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
