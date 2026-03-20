# 🌍 Localization App Lab

![Swift](https://img.shields.io/badge/Swift-5.10-orange.svg)
![iOS](https://img.shields.io/badge/iOS-17.0%2B-blue.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-4.0%2B-blueviolet.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

> Um laboratório prático demonstrando arquitetura sênior e técnicas avançadas de internacionalização (i18n) e localização (l10n) no ecossistema da Apple.

O **GlobalScale Lab** foi desenvolvido para provar que a localização não é apenas um "detalhe de tradução final", mas sim uma estratégia fundamental de engenharia e crescimento de produtos mobile. Este projeto demonstra como criar um aplicativo SwiftUI que é 100% resiliente a mudanças de idioma, formatadores e unidades de medida, sem o uso de "Magic Strings" ou refatorações de layout complexas.

---

## 📈 Business Case: O Impacto da Internacionalização

A internacionalização bem executada é a estratégia de maior ROI no ecossistema mobile. Este projeto foi construído sobre dados de mercado comprovados:

* ** Downloads (+128%):** Localizar metadados e o aplicativo pode aumentar os downloads em mais de 100%, em média.
* ** Receita (+26% por idioma):** Empresas veem um aumento imediato na receita para cada novo idioma adicionado.
* ** Decisão de Compra (72%):** Mais de 70% dos consumidores globais afirmam que só compram ou assinam um produto se o aplicativo estiver no seu idioma nativo.

Ao internacionalizar o aplicativo desde o "Dia 1", reduzimos o custo de desenvolvimento para novos mercados de meses para horas.

---

## 🏗️ Destaques da Arquitetura e Engenharia (SOLID)

Este repositório demonstra o domínio dos conceitos de **Clean Code**, princípios **SOLID** e as APIs mais modernas do SwiftUI/Foundation:

### 1. Centralização Typada de Strings (S & O Principles)
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
