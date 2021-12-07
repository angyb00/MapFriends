import SwiftUI

struct ExistingGroups: View {
    @State var listItems = Create.shared.existingGroups
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            List {
                ForEach(listItems, id: \.self) { item in
                    getText(fromGrp: item)
                }.onDelete(perform: self.deleteItem)
            }
        }

        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }

    private func deleteItem(at indexSet: IndexSet) {
        Create.shared.delete(at: indexSet)
        self.listItems = Create.shared.existingGroups
    }

    private func getText(fromGrp item: Create.Group) -> some View {
        let grp = """
        Name: \(item.groupName)
        Location: \(item.location)
        Point Of Interest: \(item.poi)
        """
        return Text(grp)
    }
}

struct ExistingGroups_Previews: PreviewProvider {
    static var previews: some View {
        ExistingGroups()
    }
}
