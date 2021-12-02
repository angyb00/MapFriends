import SwiftUI
import UIKit

struct DashBoardView: View {
    @State var selectedView = 1
    @State var showCreateGroup = false
    @State var showGroups = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            TabView(selection: $selectedView) {
                TabView1()
                    .tabItem {
                        Label("Map", systemImage: "1.circle")
                    }
                    .tag(1)

                TabView2(action: {
                    self.selectedView = 1
                })
                    .tabItem {
                        Label("More", systemImage: "2.circle")
                    }
                    .tag(2)
                    .position(x: 60, y: 40)
            }.onAppear {
                loadGroups()
            }
            Button {
                self.showCreateGroup = true
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.frame(width: 44, height: 44).padding(16)
                .fullScreenCover(isPresented: $showCreateGroup) {
                print("")
            } content: {
                GroupDetails()
            }
            Button {
                self.showGroups = true
            } label: {
                Text("Groups")
            }.frame(width: 64, height: 44).padding(.init(top: 16, leading: 350, bottom: 0, trailing:0))
                .fullScreenCover(isPresented: $showGroups) {
                    print("")
                } content: {
                    ExistingGroups()
                }
        }
    }
}

func loadGroups(){
    DataManager.shared.loadAllGroups()
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}

struct TabView1:View {
    @State var showCreateGroup = false
    var body: some View {
        Text(verbatim: "")
    }
}

struct TabView2:View {
    @State var buttonAction:()->Void

    var body: some View {
        Button("Welcome") {
            self.buttonAction()
        }
    }
    init(action:@escaping ()->Void) {
        self.buttonAction = action
    }
}
