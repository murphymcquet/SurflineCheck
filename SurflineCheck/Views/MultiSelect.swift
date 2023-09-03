//
//  MultiSelect.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 8/30/23.
//

import SwiftUI

struct MultiSelectView<Obj: Hashable & StringProtocol>: View {
    var objects: [Obj]
    @Binding var selected: Set<Obj>
    
    var body: some View {
        List(objects, id: \.self) { obj in
            HStack {
                Text(obj)
                if selected.contains(obj) {
                    Spacer()
                    Image(systemName: "checkmark.circle")
                }
            }
            .onTapGesture {
                if (selected.contains(obj)) {
                    selected.remove(obj)
                }
                else {
                    selected.insert(obj)
                }
            }
        }
    }
}

struct MultiSelectView_Dummy : View {
    var options = ["Option A", "Option B", "Option C"]
     @State private var selected = Set<String>()

     var body: some View {
         MultiSelectView(objects: self.options, selected: $selected)
     }
}

struct MultiSelectView_Preview: PreviewProvider {
    
    static var previews: some View {
        MultiSelectView_Dummy()
    }
}
