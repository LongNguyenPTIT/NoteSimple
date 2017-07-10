//
//  NoteManagement.swift
//  LongNguyen_NoteiOS
//
//  Created by Long Nguyen on 7/10/17.
//  Copyright © 2017 Long Nguyen. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NoteManagement {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    // Create a note
    func createNote(title: String, content: String, isOffline: Bool) -> NoteModel {
        
        let newNote = NSEntityDescription.insertNewObject(forEntityName: "NoteModel", into: context) as! NoteModel
        
        newNote.title = title
        newNote.content = content
        newNote.isUpdate = false
        newNote.isDelete = false
        newNote.isOffline = isOffline
        
        return newNote
    }
    
    // Gets a note by id
    func getById(id: NSManagedObjectID) -> NoteModel? {
        return context.object(with: id) as? NoteModel
    }
    
    
    func getAll() -> [NoteModel]{
        return get(withPredicate: NSPredicate(value:true))
    }
    
    // Gets all that fulfill the specified predicate.
    func get(withPredicate queryPredicate: NSPredicate) -> [NoteModel]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NoteModel")
        
        fetchRequest.predicate = queryPredicate
        
        do {
            let response = try context.fetch(fetchRequest)
            return response as! [NoteModel]
            
        } catch let error as NSError {
            // failure
            print(error)
            return [NoteModel]()
        }
    }
    // Updates a note
    func update(updatedNote: NoteModel){
        if let note = getById(id: updatedNote.objectID){
            note.title = updatedNote.title
            note.content = updatedNote.content
        }
    }
    
    // Deletes a note
    func delete(id: NSManagedObjectID){
        if let noteToDelete = getById(id: id){
            context.delete(noteToDelete)
        }
    }
    
    // Saves all changes
    func saveChanges(){
        do{
            try context.save()
        } catch let error as NSError {
            // failure
            print(error)
        }
    }
}
