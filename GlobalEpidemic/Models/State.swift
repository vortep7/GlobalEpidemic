//
//  State.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 22.03.2024.
//

import Foundation

protocol FieldState {
}

class ValidState: FieldState {
}

class InvalidState: FieldState {
}

class StateManager {
    private var currentState:FieldState = ValidState()
    
    func setState(_ newState: FieldState) {
        self.currentState = newState
    }
}

