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
                ScrollView {
                    // TODO: get reports data
                    ForEach(Report.sampleData) { report in
                        NavigationLink(destination: Text("yo")) {
                            CardView(report: report)
                        }
                    }
                    Spacer()
                }
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

struct Home_Preview: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
