//
//  Song.swift
//  UpworkApp-3
//
//  Created by Caner Çağrı on 14.11.2022.
//

import Foundation

struct SongModel {
    var name: String
    var image: String
    var view: String
}

struct SongData {
    static var data: [SongModel] = [SongModel(name: "Monkeys Spinning Monkeys", image: "monkey", view: "922.5 M Views"),
                                    SongModel(name: "Love You So", image: "love", view: "1B Views"),
                                    SongModel(name: "Baby Otaku", image: "baby", view: "716.6M Views"),
                                    SongModel(name: "Cuff It", image: "cuff", view: "409.7M Views"),
                                    SongModel(name: "Aesthetic", image: "aesthetic", view: "306.9M Views"),
                                    SongModel(name: "Orginial Sound - Rinaskrg", image: "rinaskrg", view: "265.8M Views"),
                                    SongModel(name: "Dj Sipak Nando Nando Meyden X DedeOmat", image: "dj", view: "320.7M Views"),
                                    SongModel(name: "Bizcochito", image: "bizcochito", view: "232.3M Views")
    ]
}
