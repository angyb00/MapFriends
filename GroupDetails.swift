//
//  GroupDetails.swift
//  project1
//
//  Created by Joji Thomas on 10/19/2021.
//

import SwiftUI

struct GroupDetails: View {
    @State var groupName:String = ""
    @State var location:String = ""
    @State var pointOftInterest:String = ""
    @State var enableAddButton = false
    @State var addedGrp = false
    @Environment(\.presentationMode) var presentationMode
    private var sharedObj = Create.shared

    var body: some View {
        VStack(alignment: .leading) {
            Form {
                TextField( "Enter Group name",text: $groupName)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: self.groupName) { _ in
                        checkAndEnableButton()
                    }

                TextField("Enter Location",text: $location)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: self.location) { _ in
                        checkAndEnableButton()
                    }

                TextField("Enter Point Of Interest",text: $pointOftInterest)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: self.pointOftInterest) { _ in
                        checkAndEnableButton()
                    }
            }.padding()
        }
        Button {
            addGroup()
        } label: {
            Text(verbatim: "Add Group")
        }
        .disabled(enableAddButton == false)
        .alert(isPresented: self.$addedGrp) {
            Alert(title: Text(verbatim: "Added Group"),
                  message: nil,
                  dismissButton: .default(.init(verbatim: "OK"),
                                          action: {
                presentationMode.wrappedValue.dismiss()
            }))}
    }

    func addGroup(){
        guard sharedObj.checkExistance(name: self.groupName) == false else {
            presentationMode.wrappedValue.dismiss()
            return
        }
        self.sharedObj.addGroup(group: .init(groupName: self.groupName,
                                        location: self.location,
                                        poi: self.pointOftInterest,
                                        groupNumber: self.sharedObj.getNextGroupNumber()))
        self.addedGrp = true
    }

    func checkAndEnableButton(){
        self.enableAddButton = !groupName.isEmpty && !location.isEmpty && !pointOftInterest.isEmpty
    }
}

struct GroupDetails_Previews: PreviewProvider {
    static var previews: some View {
        GroupDetails()
    }
}
