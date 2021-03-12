//
//  ResultView.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI

struct ResultView: View {
    let match : Case
    let savedMatch : SavedCase?
    let timeSaved : Date?
    let isSaved : Bool
    
    @State private var showingDeleteAlert = false
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geo in
            NavigationView{
                VStack{
                    Image(String(describing: match.bodyPart))
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("We think you might have \(match.name.capitalized.lowercased())")
                    Text(match.advice)
                    
                    Button(action: {isSaved ? self.showingDeleteAlert.toggle() : saveCase()}, label: {
                        Group{
                        Text(isSaved ? "Delete from My history" : "Add to My history")
                        Image(systemName: "clock.arrow.circlepath")
                        }
                    })
                    .foregroundColor(.white)
                    .padding()
                    .background(isSaved ? Color.red : Color.blue)
                    .cornerRadius(15)
                    
                    Text(isSaved ? "Saved on: \(dateToString(date: self.timeSaved ?? Date()))" : "This case is currently not saved").foregroundColor(.secondary)
                    
                    Spacer()
                }
                .alert(isPresented: $showingDeleteAlert) {
                            Alert(title: Text("Delete case"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")) {
                                    self.deleteCase()
                                }, secondaryButton: .cancel()
                            )
                        }
                .navigationBarTitle(match.name)
            }
        }
    }
    
    func deleteCase(){
        if(savedMatch != nil){
            moc.delete(savedMatch!)
            try? self.moc.save()
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func saveCase(){
        let savedCase = SavedCase(context: self.moc)
        savedCase.name = self.match.name
        savedCase.advice = self.match.advice
        savedCase.bodyPart = String(describing: self.match.bodyPart)
        savedCase.timeSaved = Date()
        
        try? self.moc.save()
        
        self.presentationMode.wrappedValue.dismiss()
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//    }
//}
