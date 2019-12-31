//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Spencer Curtis on 7/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

	//MARK: - Outlets
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var reasonToReadTextView: UITextView!
	

	// MARK: - Properties
	var bookController: BookController?
	var book: Book?

	override func viewDidLoad() {
		super.viewDidLoad()

		updateViews()
	}

	// MARK: - Methods
	private func updateViews() {
		if book?.title == nil {
			titleTextField.text = book?.title
			reasonToReadTextView.text = book?.reasonToRead
			title = "Add a new book"
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - Actions
	@IBAction func saveButton(_ sender: Any) {
		guard let title = titleTextField.text,
		let hasBeenRead = book?.hasBeenRead,
			let book = book,
		let reason = reasonToReadTextView.text else { return }

		if bookController?.books == nil {
			guard let title = titleTextField.text,
				//let hasBeenRead = book.hasBeenRead,
			let reason = reasonToReadTextView.text else { return }

			bookController?.createABook(title: title, reasonToRead: reason, hasBeenRead: hasBeenRead)
		}
		else {
			bookController?.updateBook(title: title, reasonToRead: reason, book: book)
		}
	}
}
