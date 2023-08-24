//
//  CreateReportView.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 8/20/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct CreateReportView: View {
    @Binding var isPresentingNewScrumView: Bool
    @State var spot: String = ""
    @State var description: String = ""
    
    let db = Firestore.firestore()
    
    var body: some View {
        let reportCollection = db.collection(Report.CollectionName)
        
        NavigationStack {
            Form {
                TextField("Spot", text: $spot)
                TextField("Description", text: $description)
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        isPresentingNewScrumView = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let report = Report(spot: self.spot, description: self.description)
                        do { try reportCollection.addDocument(from: report) }
                        catch { }
                        isPresentingNewScrumView = false
                    }
                }
            }
        }
    }
}

struct CreateReportView_Preview: PreviewProvider {
    static var previews: some View {
        CreateReportView(isPresentingNewScrumView: .constant(true))
    }
}
