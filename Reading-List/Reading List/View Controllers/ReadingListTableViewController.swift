//
//  ReadingListTableViewController.swift
//  Reading List
//
//  Created by Percy Ngan on 12/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ReadingListTableViewController: UITableViewController, BookTableViewCellDelegate {

	// MARK: - Properties
	let bookController = BookController()

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		tableView.reloadData()
	}

	// MARK: - Helper methods
	func book(for indexPath: IndexPath) -> Book {
		if indexPath.section == 0 {
			return bookController.readBooks[indexPath.row]
		} else {
			return bookController.unreadBooks[indexPath.row]
		}
	}

	func toggleHasBeenRead(for cell: BookTableViewCell) {
		if let book = cell.book {
			bookController.updateHasBeenRead(for: book)
			tableView.reloadData()
		}
//		guard let indexPath = tableView.indexPath(for: cell) else { return }
//		let bookA = book(for: indexPath)
//		bookController.updateHasBeenRead(for: bookA)
//		tableView.reloadData()
	}

	// MARK: - Table view data source
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 0 {
			return "Read Books"
		} else {
			return "Unread Books"
		}
	}


	override func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return bookController.readBooks.count
		} else {
			return bookController.unreadBooks.count
		}
	}


	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)

		guard let bookCell = cell as? BookTableViewCell else { return cell }

		bookCell.book = book(for: indexPath)
		bookCell.delegate = self

		return cell
	}

	// Override to support editing the table view.
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}

	// MARK: - Navigation

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		guard let destination = segue.destination as? BookDetailViewController else { return }
//		destination.bookController = bookController
//
//		if segue.identifier == "ShowDetailSegue" {
//			guard let cell = sender as? BookTableViewCell else { return }
//			destination.book = cell.book
//		}
		//if segue.identifier == "AddBookSegue"
			guard let addBookVC = segue.destination as? BookDetailViewController else { return }
			addBookVC.bookController = bookController
			if segue.identifier == "ShowDetailSegue" {
				guard let showDetailVC = sender as? BookTableViewCell else { return }
				addBookVC.book = showDetailVC.book

				//showDetailVC.book = book(for: indexPath)
				//showDetailVC.bookController = bookController
			}
		}
	}


