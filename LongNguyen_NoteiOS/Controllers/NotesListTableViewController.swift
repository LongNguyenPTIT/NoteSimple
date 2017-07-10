//
//  NotesListTableViewController.swift
//  LongNguyen_NoteiOS
//
//  Created by Long Nguyen on 7/9/17.
//  Copyright © 2017 Long Nguyen. All rights reserved.
//

import UIKit

class NotesListTableViewController: UITableViewController {
    
    var notes = [NoteModel]()
    var noteManagement = NoteManagement()
    var delegate: NoteDetailViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        notes = noteManagement.getAll()
        tableView.sizeToFit()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell") as! NoteCell
        cell.note = notes[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        notes.remove(at: indexPath.row)
        noteManagement.delete(id: notes[indexPath.row].objectID)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.bottom)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let noteDetailViewController = segue.destination as! NoteDetailViewController
        noteDetailViewController.delegate = self
        
        if segue.identifier == "showNote" {
            var selectedIndexPath = tableView.indexPathForSelectedRow
            noteDetailViewController.note = notes[selectedIndexPath!.row]
            noteDetailViewController.note.isUpdate = true
            noteDetailViewController.indexPath = selectedIndexPath
        }
    }

}

extension NotesListTableViewController: NoteDetailViewDelegate {

    func dataUpdate(didUpdate: NoteModel, indexPath: IndexPath) {
        notes[indexPath.row] = didUpdate
    }
    
    func dataCreate(didUpdate: NoteModel) {
        notes.append(didUpdate)
    }
}
