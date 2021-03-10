//
//  HistoryView.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI

func dateToString(date : Date) -> String{
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter.string(from: date)
}

struct HistoryView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: SavedCase.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \SavedCase.timeSaved, ascending: false)
    ]) var savedCases: FetchedResults<SavedCase>
    
    @State private var showingDetailScreen = false
    
//    @State private var selectedCase = Case(name: "Placeholder", description: "Lorem ipsum dolor sir amet", advice: "Lorem ipsum dolor sir amet", answers: [])
    
    var body: some View {
        NavigationView{
            VStack{
            Text("When you click the save button on a case you have received, you can find it here.").foregroundColor(.secondary)
            List {
                ForEach(savedCases, id: \.self) { savedCase in
                    Button(action: {  self.showingDetailScreen.toggle() }, label: {
                    VStack(alignment: .leading) {
                        Text(savedCase.name ?? "Unknown Case")
                            .font(.headline)
                        Text("Saved on: \(dateToString(date: savedCase.timeSaved ?? Date()))" ?? "Unknown time")
                            .foregroundColor(.secondary)
                    }
                    .sheet(isPresented: $showingDetailScreen) {
                        ResultView(match: Case(name: savedCase.name ?? "Unknown case", description: "Placeholder", advice: savedCase.advice ?? "Unknown advice", answers: []), savedMatch: savedCase, timeSaved: savedCase.timeSaved, bodyPart: BodyPart(rawValue: savedCase.bodyPart ?? "head") ?? BodyPart.head, isSaved: true)
                    }})
                }.onDelete(perform: deleteCase)
            }
            }.navigationBarTitle("History")
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteCase(at offsets: IndexSet) {
            for offset in offsets {
                // find this book in our fetch request
                let savedCase = savedCases[offset]
                
                // delete it from the context
                moc.delete(savedCase)
            }
            
            // save the context
            try? moc.save()
        }

//
//    func goToDetail(savedCase : SavedCase){
//        self.selectedCase = Case(name: savedCase.name ?? "Unknown case", description: "Placeholder", advice: savedCase.advice ?? "Unknown advice", answers: [])
//        self.showingDetailScreen.toggle()
//    }
}
    
    struct HistoryView_Previews: PreviewProvider {
        static var previews: some View {
            HistoryView()
        }
    }