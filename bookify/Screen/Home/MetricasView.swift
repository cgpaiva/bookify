//
//  MetricasView.swift
//  bookify
//
//  Created by Gabriel on 30/06/23.
//

import SwiftUI
import SwiftUICharts
import SegmentedPicker

struct MetricasView: View {
    
    @State private var selectedIndex = 0
    let titles: [String] = ["Dia", "Semana", "Mês"]
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    
                    SegmentedPicker(
                               titles,
                               selectedIndex: Binding(
                                   get: { selectedIndex },
                                   set: { selectedIndex = $0! }),
                               selectionAlignment: .bottom,
                               content: { item, isSelected in
                                   Text(item)
                                       .foregroundColor(isSelected ? Color.black : Color.gray )
                                       .padding(.horizontal, 16)
                                       .padding(.vertical, 8)
                               },
                               selection: {
                                   VStack(spacing: 0) {
                                       Spacer()
                                       Color.black.frame(height: 1)
                                   }
                               })
                               .onAppear {
                                   selectedIndex = 0
                               }
                               .animation(.easeInOut(duration: 0.3))
                    
                    BarChartView(data: ChartData(values: [
                        ("Segunda Feira", 8),
                        ("Terça Feira", 23),
                        ("Quarta Feira", 54),
                        ("Quinta Feira", 12),
                        ("Sexta Feira", 45),
                        ("Sábado", 30),
                        ("Domingo", 30)
                    ]), title: "Clientes Atendidos\n(Semana)", legend: "Nessa semana",
                                 style: Styles.barChartStyleNeonBlueDark, form: CGSize(width: geometry.size.width - 40, height: 240))
                    .padding(.horizontal) // Adicionar espaçamento horizontal
                    .frame(width: geometry.size.width) // Definir a largura do gráfico
                    
                    HStack(spacing: 20) {
                        // Card com o lucro da semana
                        VStack(alignment: .leading, spacing: 10) {
                            Spacer() // Adiciona um espaço vazio no topo
                            Text("Lucro da Semana")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            Spacer() // Adiciona um espaço vazio no meio
                            Text("R$ 500,00")
                                .font(.title)
                                .foregroundColor(.white)
                            Spacer() // Adiciona um espaço vazio na parte inferior
                        }
                        .padding()
                        .frame(width: (geometry.size.width - 60) / 2 + 50, height: 150) // Definir a largura e altura do card
                        .background(Color.black)
                     

                        // Card com a porcentagem de clientes que não retornaram
                        VStack(alignment: .leading, spacing: 10) {
                            Spacer() // Adiciona um espaço vazio no topo
                            Text("CSR")
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            Spacer() // Adiciona um espaço vazio no meio
                            Text("20%")
                                .font(.title)
                                .foregroundColor(.red)
                            Spacer() // Adiciona um espaço vazio na parte inferior
                        }
                        .padding()
                        .frame(width: (geometry.size.width - 60) / 2 - 50, height: 150) // Definir a largura e altura do card
                        .background(Color.black)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    .padding(.bottom, 20)

 // Adicionar espaçamento inferior entre os cards
                }
                .padding(.vertical, 20) // Adicionar espaçamento vertical
                .frame(width: geometry.size.width) // Definir a largura do ScrollView
            }
        }
    }
}

struct MetricasView_Previews: PreviewProvider {
    static var previews: some View {
        MetricasView()
    }
}
