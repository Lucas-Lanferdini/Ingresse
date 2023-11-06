//
//  PerfilView.swift
//  IngresseProojeto
//
//  Created by LucasLanferdini on 06/11/23.
//

import SwiftUI

struct Perfil: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
    var description: String
    var seta: String
    
}
struct Servico: Identifiable {
    var id = UUID()
    var iconServicos: String
    var titleServicos: String
    var descriptionServicos: String
}
struct PerfilPessoas: View {
    var perfil: Perfil
    var body: some View {
        HStack(spacing: 5){
            Image(systemName: perfil.icon)
                .foregroundStyle(.gray)
                .font(.system(size: 22))
            
            VStack(alignment: .leading, spacing: 6){
                Text(perfil.title)
                    .bold()
                    .font(.system(size: 18))
                
                Text(perfil.description)
                    .font(.system(size: 17))
            }
            Spacer()
            Image(systemName: perfil.seta)
                .foregroundStyle(.orange)
                .font(.system(size: 18))
        }.padding([.bottom], 10)
    }
}
struct ServicosPerfil: View {
    var servico: Servico
    var body: some View {
        HStack(spacing:5){
            Image(systemName: servico.iconServicos)
                .foregroundStyle(.gray)
                .font(.system(size: 22))
            VStack(alignment: .leading, spacing: 6){
                Text(servico.titleServicos)
                    .bold()
                    .font(.system(size: 18))
                
                Text(servico.descriptionServicos)
                    .font(.system(size: 17))
                    .foregroundStyle(.gray)
            }
        }
        HStack(spacing: 5){
            Image(systemName:"button.vertical.left.press")
                .foregroundStyle(.red)
                .font(.system(size: 22))
            Text("Sair")
                .bold()
                .font(.system(size: 18))
            Spacer()
            Text("Versao 4.30.1")
                .font(.system(size: 17))
                .foregroundStyle(.gray)

        }
    }
}
struct PerfilView: View {
    var perfis: [Perfil] = [Perfil(icon: "person",title:"Meus dados",description:"Minha lista de transações",seta:"chevron.right"),Perfil(icon: "bag", title: "Minhas compras",description: "Minha lista de transições",seta: "chevron.right"), Perfil(icon:"ticket",title:"Meus ingressos",description:"Carteira de ingressos",seta:"chevron.right"),Perfil(icon:"creditcard",title:"Pagamentos",description: "Meus cartões e outros dados",seta: "chevron.right"),Perfil(icon: "location", title: "Endereços", description: "Meus endereços cadastrados", seta: "chevron.right"),Perfil(icon: "iphone.gen1", title: "Dispositivos conectados", description: "Meus dispositivos", seta: "chevron.right")]
    
    var servicos: [Servico] = [Servico(iconServicos: "questionmark.circle", titleServicos: "Fale com a Ingresse", descriptionServicos: "Suporte e dúvidas frequentes")]
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image("BRUNA")
                    .resizable()
                    .scaledToFit()
                    .frame(height:150)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Fulano Beltrano")
                        .bold()
                        .font(.system(size: 25))
                    Text("fulano@exemplo..com")
                        .foregroundStyle(.gray)
                }
                Spacer()
            }
            
            Text("MINHA CONTA")
                .foregroundColor(.gray)
                .bold()
                .padding(.leading)
            
            List {
                ForEach(perfis) { perfil in
                    PerfilPessoas(perfil: perfil)
                }
          
           
        
            Text("SERVIÇOS")
                .padding()
                .foregroundColor(.gray)
                .bold()
                
                
                    ForEach(servicos){
                        servico in ServicosPerfil(servico: servico)
                    }
                
            }
        }
    }
}
#Preview {
    PerfilView()
}
