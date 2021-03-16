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
            VStack{
                if(isSaved){ EmptyView() } else { Text(match.name).font(.largeTitle).fontWeight(.bold).padding(.top)}
                
                Image(String(describing: match.bodyPart))
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width)
                
                Label("We want to make clear that you should not rely heavily on our advice, if you have serious complaints it is always recommended to check in with a professional.", systemImage: "exclamationmark.triangle")
                    .foregroundColor(.orange)
                    .padding()
                    .background(Color.init(red: 250 / 255, green: 250 / 255, blue: 245 / 255))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.orange, lineWidth: 2)
                    )
                    .padding()
                
                List{
                    Section(header: Text("Diagnosis")){
                        if match.name == "Perfectly fine" {
                            Text("We think there is probably nothing to worry about")
                            Text("We don't think there is a need to visit your GP. If it stays on for much longer you should pay a visit")
                        } else{
                            Text("We think you might have \(match.name.capitalized.lowercased())")
                            Text("We advise you to \(match.advice)")
                        }
                    }
                }
                
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
            }.navigationBarTitle(Text(match.name), displayMode: isSaved ? .inline : .large)
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
        savedCase.bodyPart = self.match.bodyPart.rawValue
        savedCase.timeSaved = Date()
        
        try? self.moc.save()
        
        self.presentationMode.wrappedValue.dismiss()
    }
}
