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
    @State var rating: String = ""
    
    @State private var searchText = ""
    var searchResults: [String] {
        if searchText.isEmpty {
            return Spot.dummySpots.sorted()
        } else {
            return Spot.dummySpots.filter { $0.contains(searchText) }.sorted()
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { spot in
                    NavigationLink {
                        CreateReportForm(spot: $spot, description: $description, rating: $rating, isPresentingNewScrumView: $isPresentingNewScrumView)
                        Text(spot)
                    } label: { Text(spot) }
                    .onTapGesture {
                        self.spot = spot
                    }
                }
            }
            .navigationTitle("Pick location")
            .searchable(text: $searchText)
        }
    }
}

struct CreateReportForm: View {
    @Binding var spot: String
    @Binding var description: String
    @Binding var rating: String
    @Binding var isPresentingNewScrumView: Bool
    
    @State var boards: [Report.Boards] = []
    @State var isPrivate: Bool = false
    @State var isWorth: String = ""
    
    var body: some View {
        let reportCollection = Firestore.firestore().collection(Report.CollectionName)
        Form {
            Section {
                Picker("Rating", selection: $rating) {
                    ForEach(Report.Ratings, id: \.self) { rating in
                        Text(rating)
                    }
                }
                TextField("Description", text: $description,  axis: .vertical)
                    .lineLimit(5...10)
            }
            Section {
                // TODO: board selection, skill selection
                Picker("Worth surfing?", selection: $isWorth) {
                    ForEach(["Yes", "No"], id: \.self) { option in
                        Text(option)
                    }
                }
                Toggle("Make private?", isOn: $isPrivate)
            }
        }
        .navigationTitle("Report: \(spot)")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Create report") {
                    let report = Report(spot: self.spot, description: self.description)
                    do { try reportCollection.addDocument(from: report) }
                    catch { }
                    isPresentingNewScrumView = false
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
