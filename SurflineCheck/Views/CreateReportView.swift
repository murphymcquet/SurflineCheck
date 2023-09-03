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
    @State var rating: String = Report.Ratings[0]
    
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
            List (searchResults, id: \.self) { spot in
                NavigationLink {
                    CreateReportForm(spot: spot, description: $description, rating: $rating, isPresentingNewScrumView: $isPresentingNewScrumView)
                    Text(spot)
                } label: { Text(spot) }
                .onTapGesture {
                    self.spot = spot
                }
            }
            .navigationTitle("Pick location")
            .searchable(text: $searchText)
        }
    }
}

struct CreateReportForm: View {
    var spot: String
    @Binding var description: String
    @Binding var rating: String
    @Binding var isPresentingNewScrumView: Bool
    
    @State var boards: Set<String> = Set<String>()
    @State var skills: Set<String> = Set<String>()
    @State var isPrivate: Bool = false
    @State var isWorth: String = isWorthAnswers[0]
    
    static var isWorthAnswers = ["Yes", "No"]
    
    var body: some View {
        let reportCollection = Firestore.firestore().collection(Report.CollectionName)
        
        Form {
            Section (header: Text("Review")) {
                Picker("Rating", selection: $rating) {
                    ForEach(Report.Ratings, id: \.self) { rating in
                        Text(rating)
                    }
                }
                TextField("Description", text: $description,  axis: .vertical)
                    .lineLimit(5...10)
                // TODO: board selection, skill selection
                Picker("Worth surfing?", selection: $isWorth) {
                    ForEach(CreateReportForm.isWorthAnswers, id: \.self) { option in
                        Text(option)
                    }
                }
            }
            
            Section (header: Text("Recommended Boards")){
                MultiSelectView(
                    objects: Report.Boards.allCases.map({
                        (value: Report.Boards) -> String in
                        return value.rawValue
                  }), selected: $boards)
            }
            
            Section (header: Text("Recommended Level")){
                MultiSelectView(
                    objects: User.SkillLevel.allCases.map({
                        (value: User.SkillLevel) -> String in
                        return value.rawValue
                  }), selected: $skills)
            }
            
            Toggle("Make report private?", isOn: $isPrivate)
        }
        .navigationTitle("Report: \(spot)")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Create report") {
                    let report = Report.sampleData[0]
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
