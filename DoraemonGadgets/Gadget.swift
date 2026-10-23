//
//  Gadget.swift
//  DoraemonGadgets
//
//  Created by Jack on 2026/10/20.
//

import SwiftUI

struct Gadget {
    let name: String
    let japaneseName: String
    let imageName: String
    let category: String
    let popularityRank: Int
    let appearances: Int
    let firstVolume: Int
    let description: String
}

let gadgets: [Gadget] = [
    Gadget(name: "任意門", japaneseName: "どこでもドア", imageName: "anywhere_door", category: "空間",
           popularityRank: 1, appearances: 106, firstVolume: 6, description:
          """
          只要心中想著想去的地點，電腦就會傳達並歪曲所在地與目的地間的空間而將兩地靠攏，跨過門就可以到達。但是不能去距離十光年以上的行星，或者是電腦地圖上沒有的地區。
          """),
    Gadget(name: "竹蜻蜓", japaneseName: "タケコプター", imageName: "hopter", category: "空間",
           popularityRank: 3, appearances: 329, firstVolume: 1, description:
          """
          在第一篇便已登場。只要把它放置在身體任何一部，就可依自己意思在天空中翱翔。內藏超小型電池，可時速八十公里連續飛行八小時。若是間斷飛行，還可撐更久！
          """),
    Gadget(name: "翻譯蒟蒻", japaneseName: "翻訳こんにゃく", imageName: "translation_gummy", category: "通訊",
           popularityRank: 7, appearances: 6, firstVolume: 12, description:
          """
          吃下去以後，無論何種語言，本來不能用語言溝通的兩人，就可以互相溝通了。
          """),
    Gadget(name: "時光機", japaneseName: "タイムマシン", imageName: "time_machine", category: "時間",
           popularityRank: 2, appearances: 138, firstVolume: 1, description:
          """
          哆啦A夢的飛毯型時光機。以前是以兩根操縱桿操縱，現在則是以按鈕操作，也有聲控功能。可以往來於時空之間，長2.2公尺，寬1.6公尺，高1.28公尺，重538公斤。故事中顯示是在西元2008年發明。
          """),
    Gadget(name: "縮小燈", japaneseName: "スモールライト", imageName: "small_light", category: "改變狀態",
           popularityRank: 6, appearances: 30, firstVolume: 5, description:
          """
          只要被它照到的東西就會變小。
          """),
    Gadget(name: "時光包巾", japaneseName: "タイムふろしき", imageName: "time_furoshiki", category: "時間",
           popularityRank: 4, appearances: 23, firstVolume: 2, description:
          """
          是一面紅色、一面藍色繪有許多時鐘圖案的布。用紅色的一面把東西包在裡面時，就會把物品變得更新；如果以藍色的方向把東西蓋在裡面，就會變得更舊。
          """),
    Gadget(name: "記憶吐司", japaneseName: "アンキパン", imageName: "memory_bread", category: "學業",
           popularityRank: 5, appearances: 1, firstVolume: 2, description:
          """
          只要壓在要背的東西上再吃下去，就可以輕輕鬆鬆的把那東西背起來。
          """)
]
