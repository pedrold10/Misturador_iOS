//
//  FormView.swift
//  Misturador
//
//  Created by ifpb on 16/12/22.
//

import SwiftUI
import CoreData

struct FormView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var nome:String = ""
    @State var valorBlue:Double = 0
    @State var valorRed:Double = 0
    @State var valorGreen:Double = 0
    @State var isEditing: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            
            
            TextField("Nome", text: self.$nome)
            
            Slider(value: $valorBlue,in: 0...1, step: 0.01)
                .colorMultiply(.blue)
            Spacer()
            Slider(value: $valorRed, in: 0...1, step: 0.01).colorMultiply(.red)
            Spacer()
            Slider(value: $valorGreen, in: 0...1, step: 0.01).colorMultiply(.green)
            Spacer()
            Rectangle().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(
                                    red: valorRed,
                                    green: valorGreen,
                                    blue: valorBlue)
                )
        }
        .navigationTitle("Cor")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem{
                    Button("Salvar"){
                        let cor = Cor(context: viewContext)
                        cor.nome = self.nome
                        cor.red = self.valorRed
                        cor.blue = self.valorBlue
                        cor.green = self.valorGreen
                        
                        do {
                            try viewContext.save()
                        } catch {
                            
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
            
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
