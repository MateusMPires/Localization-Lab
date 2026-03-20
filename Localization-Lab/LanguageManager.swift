//
//  LanguageManager.swift
//  Localization-Lab
//
//  Created by Mateus Martins Pires on 19/03/26.
//

import SwiftUI

@Observable
class LanguageManager {
    var selectedLocale: Locale = Locale(identifier: "pt_BR")
    
    let supportedLocales = [
        Locale(identifier: "pt_BR"),
        Locale(identifier: "en_US"),
        Locale(identifier: "de_DE")
    ]
}
