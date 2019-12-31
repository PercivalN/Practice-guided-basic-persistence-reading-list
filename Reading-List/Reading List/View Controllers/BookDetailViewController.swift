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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	// MARK: - Actions
	@IBAction func saveButton(_ sender: Any) {
	}


}

