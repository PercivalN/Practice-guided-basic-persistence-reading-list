//
//  BookTableViewiCellDelegate.swift
//  Reading List
//
//  Created by Percy Ngan on 12/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate {
	func toggleHasBeenRead(for cell: BookTableViewCell)
}
