//
//  ItemListView.swift
//  Misturador
//
//  Created by ifpb on 16/12/22.
//

import SwiftUI

struct ItemListView: View {
    var cor: Cor
    var body: some View {
        HStack{
            Circle()
                .frame(height: 20)
                .foregroundColor(Color(
                    red: cor.red,
                    green: cor.green,
                    blue: cor.blue
                    )
                )
            Text(cor.nome ?? "\\")
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(cor: Cor())
    }
}
