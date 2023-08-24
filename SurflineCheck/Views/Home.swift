//
//  Home.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 8/16/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct Home: View {
    @State private var isPresentingNewScrumView = false
    
    // Testing hacky shit
    @State private var numberOfReports: Int = 0
    
    var body: some View {
        NavigationStack{
            VStack() {
                let reportsDest = ReportsView(numberOfReports: $numberOfReports)
                    .onAppear() {
                        let _ = print("I'm trying")
                        Task {
                            numberOfReports = await GetNumberOfReports()
                        }
                    }
                NavigationLink(destination: reportsDest) {
                    CardView(title: "Reports", icon: Image(systemName: "star.bubble"))
                }
                NavigationLink(destination: SpotsView()) {
                    CardView(title: "Spots", icon: Image(systemName: "figure.surfing"))
                }
                NavigationLink(destination: FriendsView()) {
                    CardView(title: "Friends", icon: Image(systemName: "person.fill"))
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Surfline Check")
            .toolbar {
                Button(action: { isPresentingNewScrumView = true }) {
                    Text("Add Report")
                }
                .accessibilityLabel("Add Report")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            CreateReportView(isPresentingNewScrumView: $isPresentingNewScrumView)
        }
    }
}

private func GetNumberOfReports() async -> Int {
    let _ = print("Trying to get reports.")
    let db = Firestore.firestore()
    let reportsCollection = db.collection(Report.CollectionName)
    var reports = 0
    do { reports = try await reportsCollection.getDocuments().count}
    catch { }
    let _ = print("Found reports! We found \(reports).")
    return reports
}

struct Home_Preview: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
