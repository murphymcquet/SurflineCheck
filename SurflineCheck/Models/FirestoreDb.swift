//
//  FirestoreDb.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 8/23/23.
//

import Foundation

protocol FirestoreDb {
    static var CollectionName: String { get }
    static var EmptyInstance: Any { get }
}
