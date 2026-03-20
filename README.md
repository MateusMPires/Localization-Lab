# 🌍 Localization Lab - iOS App

![Swift](https://img.shields.io/badge/Swift-5.10-orange.svg)
![iOS](https://img.shields.io/badge/iOS-17.0%2B-blue.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-4.0%2B-blueviolet.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

> Um laboratório prático demonstrando arquitetura sênior e técnicas avançadas de internacionalização (i18n) e localização (l10n) no ecossistema da Apple.

O **GlobalScale Lab** foi desenvolvido para provar que a localização não é apenas um "detalhe de tradução final", mas sim uma estratégia fundamental de engenharia e crescimento de produtos mobile. Este projeto demonstra como criar um aplicativo SwiftUI que é 100% resiliente a mudanças de idioma, formatadores e unidades de medida, sem o uso de "Magic Strings" ou refatorações de layout complexas.

---

## 📈 Business Case: O Impacto da Internacionalização

A internacionalização bem executada é a estratégia de maior ROI no ecossistema mobile. Este projeto foi construído sobre dados de mercado comprovados:

* **Downloads (+128%):** Localizar metadados e o aplicativo pode aumentar os downloads em mais de 100%, em média.
* **Receita (+26% por idioma):** Empresas veem um aumento imediato na receita para cada novo idioma adicionado.
* **Decisão de Compra (72%):** Mais de 70% dos consumidores globais afirmam que só compram ou assinam um produto se o aplicativo estiver no seu idioma nativo.

Ao internacionalizar o aplicativo desde o "Dia 1", reduzimos o custo de desenvolvimento para novos mercados de meses para horas.

---

## 🏗️ Destaques da Arquitetura e Engenharia (SOLID)

Este repositório demonstra o domínio dos conceitos de **Clean Code**, princípios **SOLID** e as APIs mais modernas do SwiftUI/Foundation:

### 1. Centralização Tipada de Strings (S & O Principles)
Eliminamos todas as "Magic Strings" das Views. Utilizamos uma estrutura hierárquica de `LocalizedStringResource` para garantir segurança em tempo de compilação, evitar erros de digitação (typos) e facilitar a manutenção por tradutores profissionais.

```swift
// Arquitetura Strings.swift
struct Strings {
    struct Sheet {
        struct Metrics {
            static let balance = LocalizedStringResource("metric_balance", defaultValue: "Saldo em Conta")
            // ...
        }
    }
}
```

### 2. Resiliência de UI com `ViewThatFits` (Resistência a Idiomas Longos)
O design foi construído para suportar o "Efeito Alemão" (onde as frases são até 50% mais longas que no Inglês). Usamos o componente `ViewThatFits` para adaptar dinamicamente o layout de `HStack` para `VStack`, garantindo que nenhum texto seja cortado ou esmagado em qualquer idioma.

### 3. Formatação Nativa de Dados (Moedas, Datas e Unidades)
Utilizamos exclusivamente a API `FormatStyle` do Foundation. Nunca escrevemos "R$" ou "dd/mm/yyyy" manualmente. Isso garante que o saldo seja exibido em Reais (`R$`) no Brasil, Dólares (`$`) nos EUA e Euros (`€`) na Alemanha, e que a data se reordene automaticamente de acordo com a região do usuário.

### 4. Conversão Dinâmica de Unidades (`Measurement`)
Demonstramos o uso do tipo `Measurement` para gerenciar a conversão automática de unidades. Forçamos a conversão de Celsius para Fahrenheit quando o usuário muda o idioma, provando o controle absoluto sobre as regras de negócio locais.

---

## 🛠️ Tecnologias e Técnicas Demonstradas

* **Swift 5.10+ / SwiftUI 4+** (utilizando as APIs mais novas).
* **String Catalogs (`.xcstrings`):** O sistema de localização de última geração da Apple.
* **Localização Adiada:** Uso de `LocalizedStringResource` e `@Environment(\.locale)` para troca de idioma em tempo real dentro do app.
* **SOLID & Namespacing:** Organização rigorosa de constantes de texto.
* **XLIFF Export/Import:** Demonstração do fluxo de trabalho padrão da indústria para envio de traduções para terceiros (agências ou IAs).
* **Animações de Transição:** Uso de `.animation` e `.id()` para criar uma UX premium durante a troca dinâmica de idioma.

---

## 🚀 Como Executar o Projeto

1. Clone este repositório.
2. Abra o arquivo `Localization-Lab.xcodeproj` no **Xcode 15.0+**.
3. Rode o projeto no simulador de sua escolha (iOS 17+).
4. Abra o Sheet de Configurações e use o Picker para trocar entre Português, Inglês e Alemão. Observe a mágica acontecer instantaneamente na interface e nos formatadores.

---

## 👨‍💻 Desenvolvedor

* **Mateus Martins Pires** - [LinkedIn](COLOQUE-SEU-LINK-AQUI)

---

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - consulte o arquivo `LICENSE.md` para detalhes.
