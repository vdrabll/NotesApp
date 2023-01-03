//
//  NotesMainViewInput.swift
//  SimpleNotesApp
//
//  Created by Виктория Федосова on 28.12.2022.
//

import Foundation

protocol NotesMainViewInput {
    
    func setupInitialState()
    func reloadTableView()
    // func loadNotes() -> [Notes]
}
