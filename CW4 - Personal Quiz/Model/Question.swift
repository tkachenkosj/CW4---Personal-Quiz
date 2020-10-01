//
//  Question.swift
//  CW4 - Personal Quiz
//
//  Created by Сергей Ткаченко on 01.10.2020.
//  Copyright © 2020 Sergey Tkachenko. All rights reserved.
//

struct Question {
    var text: String
    var type: ResponseType
    var ansvers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Какую пищу вы предпочитаете?",
                type: .single,
                ansvers: [
                    Answer(text: "Стейк", type: .dog),
                    Answer(text: "Рыба", type: .cat),
                    Answer(text: "Морковь", type: .rabbit),
                    Answer(text: "Кукуруза", type: .turtile)
                ]
            ),
            Question(
                text: "Что вам больше нравится?",
                type: .multiple,
                ansvers: [
                    Answer(text: "Плавать", type: .dog),
                    Answer(text: "Спать", type: .cat),
                    Answer(text: "Обниматься", type: .rabbit),
                    Answer(text: "Есть", type: .turtile)
                ]
            ),
            Question(
                text: "Любите ли вы поездки на машине?",
                type: .ranged,
                ansvers: [
                    Answer(text: "Ненавижу", type: .dog),
                    Answer(text: "Нервничаю", type: .cat),
                    Answer(text: "Не замечаю", type: .rabbit),
                    Answer(text: "Обожаю", type: .turtile)
                ]
            ),
        ]
    }
}
