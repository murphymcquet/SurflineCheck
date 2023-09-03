//
//  CardView.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 8/16/23.
//

import SwiftUI

struct CardView: View {
    let report: Report
    
    var body: some View {
        HStack {
            Text(report.spot)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            VStack {
                let ratingColor = Report.RatingsColorMap.first { (key: String, value: Color) in
                    key == report.report.rating
                }?.value ?? Color.black
                Text(report.report.rating)
                    .bold()
                    .foregroundColor(ratingColor)
                Text(GetTimeFromNowForDisplay(date: report.timestamp))
                    .font(.footnote)
                    .italic()
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
        )
    }
}

extension CardView {
    func GetTimeFromNowForDisplay(date: Date) -> String {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.year,.month,.day,.hour, .minute,.second], from: date, to: Date.now)
        
        let _ = print(components.day ?? -1)
        
        if ((components.year ?? 0) > 0) {
            return String(components.year ?? 0) + "y ago"
        }
        else if ((components.month ?? 0) > 0) {
            return String(components.month ?? 0) + "m ago"
        }
        else if ((components.day ?? 0) > 0) {
            return String(components.day ?? 0) + "d ago"
        }
        else if ((components.hour ?? 0) > 0) {
            return String(components.hour ?? 0) + "h ago"
        }
        else if ((components.minute ?? 0) > 1) {
            return String(components.minute ?? 0) + " minutes ago"
        }
        else {
            return "Just now"
        }
    }
}

struct CardView_Preview: PreviewProvider {
    static var previews: some View {
        CardView(report: Report.sampleData[1])
    }
}
