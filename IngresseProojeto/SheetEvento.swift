//
//  SheetEvento.swift
//  IngresseProojeto
//
//  Created by LucasLanferdini on 06/11/23.
//

import SwiftUI


struct EventoSheet: Identifiable {
    var id = UUID()
    var nome : String
    var mes: String
    var sessoes: String
    var endereco: String
    
    
}
struct HeaderSheet: View{
    @State var isPresented: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var nome : String = "Privilège"
    var mes: String = "Dezembro"
    var sessoes: String = "31 Dez. 2023 - 22:00"
    var body: some View{
        HStack(spacing: 12){
            
            Button("Back") {
                
                self.isPresented = true
                dismiss()
                
            }
            
            
            
            
            
            
            Text("\(nome) - \(mes)")
                .font(.title)
                .font(.system(size: 15))
                .bold()
        }            .navigationDestination(isPresented: $isPresented, destination: { EventosView() })
        
            .padding()
        
        Text(sessoes)
            .font(.subheadline)
            .padding([.bottom], 10)
        
    }
}

struct SheetEvento: View {
    
    @State var flag: Bool = false
    var endereco: String = "Local a definir, Xangri-lá - RS"
    var body: some View {
        
        VStack{
            HeaderSheet()
            ScrollView {
                Button(action: {
                    openMap(Address: "Xangri-la,RS,Brasil")
                }){
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 12.0)
                            .frame(width: 375, height: 50)
                        Text(endereco)
                            .foregroundStyle(.white)
                            .frame(width:250, height:50)
                            .bold()
                    }
                }
               
                VStack(alignment: .leading){
                    Text("Regras de Venda Online")
                        .font(.title2)
                        .font(.system(size: 15))
                        .padding([.bottom], 20)
                    Text("1) A Ingresse é uma plataforma intermediária especializada na venda de ingressos online para eventos. Os organizadores dos eventos utilizam a nossa plataforma para ofertar seus eventos ao público. Dessa forma, a Ingresse não é responsável, em nenhum nível, pela produção, organização, política de vendas, precificação, meia-entrada, atrações, alterações de datas e local de realização do evento e demais questões definidas, única e exclusivamente, pelo organizador do evento; \n\n2) A responsabilidade da Ingresse limita-se estritamente ao uso e manutenção da tecnologia em si, ou seja, dos seus serviços de licenciamento do uso da plataforma da Ingresse; \n\n3) O organizador do evento é exclusivamente responsável por suas atividades estarem em conformidade com todo o arcabouço legislativo aplicável a seu evento, incluindo, mas não se limitando a, obtenção de (i) alvará de autorização para realização do evento, (ii) licença de funcionamento, divulgação e cumprimento de (i) protocolos locais e nacionais de prevenção da Covid-19 ou (ii) outras políticas sanitárias estabelecidas no local e na data de execução dos eventos;\n\n4) O site (www.ingresse.com) e o App (Ingresse - Eventos e Ingressos) são os únicos canais oficiais de vendas da Ingresse. A Ingresse não se responsabiliza, em qualquer aspecto, por ingressos adquiridos com terceiros; \n\n5) A Ingresse reserva-se o direito de cancelar as compras e reembolsar todos os compradores caso identifique qualquer irregularidade na organização ou execução dos eventos não solucionadas por seus respectivos organizadores; \n6) Compras suspeitas ou com evidências de fraude de qualquer natureza no processo de compra serão canceladas e reembolsadas; \n\n7) Para acessar o evento é obrigatória a apresentação do ingresso em formato digital, através do App (Ingresse - Eventos e Ingresse) , juntamente com o respectivo documento oficial com foto;\n\n8) O não comparecimento ao evento invalidará o ingresso e não permitirá reembolso;\n\n9) Solicitações de estorno/cancelamento em razão do exercício do direito de arrependimento deverão ser efetuadas em até 7 dias contados da data de compra do ingresso, desde que seja realizada com antecedência mínima de 48 (quarenta e oito) horas antes da realização do evento.; \n\n10) Em caso de cancelamento do evento ou de solicitação de estorno da compra em razão do exercício do direito de arrependimento, a taxa de serviço da Ingresse e a taxa de processamento serão descontados do valor total do reembolso.Nos termos da Lei Nº 14.046, de 24 de agosto de 2020 e suas alterações, na hipótese de adiamento ou de cancelamento do evento, em decorrência da pandemia da Covid-19, e, exclusivamente na situação em que o organizador do evento optar pelo reembolso, a taxa de serviço da Ingresse será descontada do valor do total do reembolso; \n\n11) Caso não conste da descrição do evento acima quaisquer informações adicionais sobre o evento, como estacionamento, cardápio, line-up, ordem de entrada de artistas e demais,relacionadas exclusivamente à organização do evento, deverão ser solicitadas diretamente para o organizador do evento, através do e-mail de contato; \n\n12) A Ingresse não permite e repudia a venda de ingressos para eventos irregulares, que não estejam seguindo todas as orientações e protocolos de segurança recomendados pelas autoridades governamentais competentes sobre a Covid-19. Consideramos, antes de tudo, a saúde e segurança de todos; \n\n13) Horário de atendimento do SAC da Ingresse é das 11h às 19h, de segunda à sexta-feira; \n\n14) Precisa de ajuda? Acesse a Central de Dúvidas da Ingresse, localizada no canto inferior de nosso site, na aba 'Ajuda' durante o processo de compra e na aba ‘Perfil’ de nosso app, para maiores informações e solicitações.")
                        .lineLimit(flag ? nil : 10)
                        .overlay(
                            GeometryReader { proxy in
                                Button(action: {
                                    flag.toggle()
                                }) {
                                    Text(flag ? "Ver Menos" : "Ver Mais")
                                        .font(.caption).bold()
                                        .padding(.leading, 8.0)
                                        .padding(.top, 4.0)
                                        .background(Color.white)
                                }
                                .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                            }
                        )
                    
                    
                    
                } .padding()
            }
        }
        Button(action: {
            if let url = URL(string: "https://www.ingresse.com/motiro-diadefeira-novembro#comprar") {
                UIApplication.shared.open(url)
            }
        }) {
            
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 250, height: 50)
                Text("Comprar ingresso")
                    .foregroundStyle(.white)
                    .frame(width:250, height:50)
                    .bold()
            }
        }
            .interactiveDismissDisabled()
        
    }
    func openMap(Address: String){
        UIApplication.shared.openURL(NSURL(string: "http://maps.apple.com/?address=\(Address)")! as URL)
    }
}

#Preview {
    SheetEvento()
}
