//
//  ContentView.swift
//  Localization-Lab
//
//  Created by Mateus Martins Pires on 19/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var manager = LanguageManager()
    @State private var isShowingSettings = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 80) {
                
                VStack(spacing: 12) {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text(Strings.Home.helloWorld)
                }
                
                Button {
                    isShowingSettings = true
                } label: {
                    Text(Strings.Home.btnText)
                        .font(.headline)
                        .padding()
                        .padding(.horizontal, 16)
                        .background(.blue, in: RoundedRectangle(cornerRadius: 15))
                        .foregroundStyle(.white)
                }
            }
            .padding()
            .sheet(isPresented: $isShowingSettings) {
                SettingsSheetView(manager: manager)
                    .environment(\.locale, manager.selectedLocale)
            }
        }
    }
}
struct SettingsSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var manager: LanguageManager
    
    // Dados fictícios para teste
    let balance: Double = 4500.50
    let tempCelsius: Double = 21.0
    let lastUpdate = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                // 1. SEÇÃO DE IDIOMA
                Section(Strings.Sheet.Language.sectionTitle) {
                    VStack(spacing: 16) {
                        Text(Strings.Sheet.Language.explanation)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.top, 4)
                        
                        Picker(Strings.Sheet.Language.pickerLabel, selection: $manager.selectedLocale) {
                            ForEach(manager.supportedLocales, id: \.self) { locale in
                                Text(flagAndName(for: locale))
                                    .tag(locale)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    .padding(.bottom, 8)
                }
                
                // 2. MÉTRICAS (Formatadores Nativos)
                Section(Strings.Sheet.Metrics.sectionTitle) {
                    LabeledContent(Strings.Sheet.Metrics.balance) {
                        Text(balance, format: .currency(code: manager.selectedLocale.currency?.identifier ?? "BRL"))
                    }
                    
                    LabeledContent(Strings.Sheet.Metrics.temp) {
                        let measure = Measurement(value: tempCelsius, unit: UnitTemperature.celsius)
                        
                        let identifier = manager.selectedLocale.identifier
                        if identifier == "en_US" || identifier == "de_DE" {
                            Text(measure.converted(to: .fahrenheit).formatted(.measurement(width: .abbreviated, usage: .asProvided)))
                        } else {
                            Text(measure.formatted(.measurement(width: .abbreviated, usage: .asProvided)))
                        }
                    }
                    
                    LabeledContent(Strings.Sheet.Metrics.date) {
                        Text(lastUpdate, format: .dateTime.day().month().year().hour().minute())
                    }
                }
                
                // 3. RESILIÊNCIA DE UI (ViewThatFits)
                Section(Strings.Sheet.Adaptability.sectionTitle) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(Strings.Sheet.Adaptability.explanation)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        
                        ViewThatFits(in: .horizontal) {
                            
                            // Tenta a horizontal primeiro
                            HStack {
                                Image(systemName: "info.circle.fill")
                                    .foregroundStyle(.blue)
                                Text(Strings.Sheet.Adaptability.warning)
                            }
                            
                            // Se não couber, vai para a vertical e diminui a fonte
                            VStack(alignment: .leading, spacing: 8) {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .font(.caption).bold()
                                    .foregroundStyle(.orange)
                                Text(Strings.Sheet.Adaptability.warning)
                                    .font(.footnote)
                                    .lineLimit(3)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .animation(.smooth, value: manager.selectedLocale)
            .navigationTitle(Strings.Sheet.General.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(Strings.Sheet.General.closeButton) { dismiss() }
            }
        }
        // Faz com que TODA a tela atualize com o idioma atual
        .id(manager.selectedLocale.identifier)
        .transition(.opacity)
    }
    
    /// Converte o Locale para o formato curto com bandeira
    private func flagAndName(for locale: Locale) -> String {
        switch locale.identifier {
        case "pt_BR":
            return "PT-BR 🇧🇷"
        case "en_US":
            return "EN 🇺🇸"
        case "de_DE":
            return "DE 🇩🇪"
        default:
            return locale.identifier
        }
    }
}

#Preview {
    ContentView()
}
