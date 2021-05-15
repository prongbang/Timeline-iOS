//
//  CoreViewModel.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

protocol CoreViewModel {
    associatedtype Intent
    
    func process(intent: Intent)
}
