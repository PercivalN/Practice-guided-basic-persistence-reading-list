//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Percy Ngan on 12/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

	// MARK: - Outlets
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var buttonLabel: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	// MARK: - Actions
	@IBAction func checkboxButton(_ sender: Any) {
	}

}
