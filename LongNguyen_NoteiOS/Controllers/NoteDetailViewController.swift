//
//  NoteDetailViewController.swift
//  LongNguyen_NoteiOS
//
//  Created by Nalou Nguyen on 7/10/17.
//  Copyright © 2017 Long Nguyen. All rights reserved.
//

import UIKit
import CoreData

protocol NoteDetailViewDelegate{
    func dataUpdate(didUpdate: NoteModel, indexPath: IndexPath)
    func dataCreate(didUpdate: NoteModel)
}

class NoteDetailViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var note:NoteModel!
    var indexPath: IndexPath?
    var noteManagement = NoteManagement()
    var delegate: NoteDetailViewDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if note != nil {
            titleTextField.text = note.title
            contentTextView.text = note.content
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSave(_ sender: UIBarButtonItem) {
        if delegate != nil {
            if titleTextField.text!.isEmpty && contentTextView.text.isEmpty {
                let alert = UIAlertController(title: "Please Type Something", message: "Your entry was left blank.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
                    
                })
                
                self.present(alert, animated: true, completion: nil)
            } else {
                if note != nil {
                    note.title = titleTextField.text!
                    note.content = contentTextView.text!
                    self.delegate?.dataUpdate(didUpdate: note, indexPath: indexPath!)
                }else {
                    note = noteManagement.createNote(title: titleTextField.text!, content: contentTextView.text!, isOffline: false)
                    self.delegate?.dataCreate(didUpdate: note)
                }
//                if note.isUpdate {
//                    
//                } else {
//                    
//                }
                
                
                noteManagement.saveChanges()
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
}
