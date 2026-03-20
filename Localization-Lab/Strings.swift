//
//  Strings.swift
//  Localization-Lab
//
//  Created by Mateus Martins Pires on 19/03/26.
//

import Foundation

struct Strings {
    
    struct Home {
        static let helloWorld = LocalizedStringResource(
            "hello_world",
            defaultValue: "Olá, internacionalização!"
        )
        
        static let btnText = LocalizedStringResource(
            "btn_text",
            defaultValue: "Explorar tradução"
        )
    }
    struct Sheet {
        
        struct General {
            static let navigationTitle = LocalizedStringResource(
                "navigation_title",
                defaultValue: "Ajustes"
            )
            static let closeButton = LocalizedStringResource("btn_close", defaultValue: "Concluído")
        }
        
        struct Language {
            static let sectionTitle = LocalizedStringResource("language_section_title", defaultValue: "Idioma do App")
            static let explanation = LocalizedStringResource("language_explanation", defaultValue: "Escolha um idioma abaixo para ver a interface e os formatadores se adaptarem instantaneamente, sem precisar reiniciar o aplicativo.")
            static let pickerLabel = LocalizedStringResource("picker_label", defaultValue: "Selecione o idioma")
        }
        
        struct Metrics {
            static let sectionTitle = LocalizedStringResource("metrics_section_title", defaultValue: "Tradução de Valores Numéricos")
            static let balance = LocalizedStringResource("metric_balance", defaultValue: "Saldo em Conta")
            static let temp = LocalizedStringResource("metric_temp", defaultValue: "Clima Local")
            static let date = LocalizedStringResource("metric_date", defaultValue: "Última Sincronização")
        }
        
        struct Adaptability {
            static let sectionTitle = LocalizedStringResource("test_section_title", defaultValue: "Teste de Adaptabilidade")
            static let explanation = LocalizedStringResource("adaptability_explanation", defaultValue: "Alguns idiomas exigem mais espaço. O SwiftUI utiliza o componente ViewThatFits para quebrar o layout verticalmente caso a frase não caiba na tela.")
            static let warning = LocalizedStringResource("resilience_text", defaultValue: "Espaço insuficiente.")
        }
    }
}
