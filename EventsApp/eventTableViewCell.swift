//
//  eventTableViewCell.swift
//  EventsApp
//
//  Created by mchow on 4/16/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class eventTableViewCell: UITableViewCell
{
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var hostImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
