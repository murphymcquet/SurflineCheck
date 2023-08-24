//
//  ReportsView.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 8/17/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ReportsView: View {
    @Binding var numberOfReports: Int
    
    var body: some View {
        Text("There are \(numberOfReports) reports.")
        let _ = print("hi!")
    }
}

struct ReportsView_Preview: PreviewProvider {
    static var previews: some View {
        ReportsView(numberOfReports: .constant(0))
    }
}
