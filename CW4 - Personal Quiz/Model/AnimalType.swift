//
//  AnimalType.swift
//  CW4 - Personal Quiz
//
//  Created by Сергей Ткаченко on 01.10.2020.
//  Copyright © 2020 Sergey Tkachenko. All rights reserved.
//

enum AnimalType: String {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtile = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case .rabbit:
            return "Вам нравится всё мягкое. Вы здоровы и полны энергии"
        case .turtile:
            return "Ваша сила в мудрости. Медленный и вдумчивый выигрывает на дальних дистанциях"
        }
    }
}
