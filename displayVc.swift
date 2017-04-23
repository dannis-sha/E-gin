//
//  displayVc.swift
//  E-gin
//
//  Created by Mac on 2017/3/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class displayVc: UIViewController {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var egn0 = [String]()
    let egn1 = [["-----","-----","-----"],["--  --","-----","-----"],["-----","--  --","-----"],["--  --","--  --","-----"],["-----","-----","--  --"],["--  --","-----","--  --"],["-----","--  --","--  --"],["--  --","--  --","--  --"]]
    var egn8 = [String]()
    let wusin = ["乾":"金","兌":"金","離":"火","震":"木","巽":"木","坎":"水","艮":"土","坤":"土","子":"水","丑":"土","寅":"木","卯":"木","辰":"土","巳":"火","午":"火","未":"土","申":"金","酉":"金","戌":"土","亥":"水"]
    let 六親 = ["金金":"兄","金木":"財","金水":"子","金火":"官","金土":"父","木金":"官","木木":"兄","木水":"父","木火":"子","木土":"財","水金":"父","水木":"子","水水":"兄","水火":"財","水土":"官","火金":"財","火木":"父","火水":"官","火火":"兄","火土":"子","土金":"子","土木":"官","土水":"財","土火":"父","土土":"兄"]
    let 地支12 = [["子","寅","辰","午","申","戌"],["巳","卯","丑","亥","酉","未"],["卯","丑","亥","酉","未","巳"],["子","寅","辰","午","申","戌"],["丑","亥","酉","未","巳","卯"],["寅","辰","午","申","戌","子"],["辰","午","申","戌","子","寅"],["未","巳","卯","丑","亥","酉"]]
    var usdata = [String]()
    var nowday = ["","","","",""]
    var 農曆 = [Int]()
    var data2 = [Int]()
    var tgDg = [String]()//四柱的八個天干地支
    var bz = [String]()
    var ww:String = ""
    var thing = ""
//    var dg = ["","",""]
    var 平閏月:String? = nil
    var 舊曆日:String? = nil
    let 旬空0 = [["甲子","乙丑","丙寅","丁卯","戊辰","己巳","庚午","辛未","壬申","癸酉"],["甲戌","乙亥","丙子","丁丑","戊寅","己卯","庚辰","辛巳","壬午","癸未"],["甲申","乙酉","丙戌","丁亥","戊子","己丑","庚寅","辛卯","壬辰","癸巳"],["甲午","乙未","丙申","丁酉","戊戌","己亥","庚子","辛丑","壬寅","癸卯"],["甲辰","乙巳","丙午","丁未","戊申","己酉","庚戌","辛亥","壬子","癸丑"],["甲寅","乙卯","丙辰","丁巳","戊午","己未","庚申","辛酉","壬戌","癸亥"]]
    var 旬空1 = ["",""]
    var tt = [String]()
    var dd = [String]()
    var tm0 = ["甲","丙","戊","庚","壬","甲","丙","戊","庚","壬"]
    var tm1 = ["甲","丙","戊","庚","壬"]
    var yinyang5 = ["甲":"陽木","乙":"陰木","丙":"陽火","丁":"陰火","戊":"陽土","己":"陰土","庚":"陽金","辛":"陰金","壬":"陽水","癸":"陰水","子":"陰水","丑":"陰土","寅":"陽木","卯":"陰木","辰":"陽土","巳":"陽火","午":"陰火","未":"陰土","申":"陽金","酉":"陰金","戌":"陽土","亥":"陽水"]
    var 命卦n = [Int]()
    var 本卦宮 = ""
    var 變卦宮 = ""
    var 本卦上 = ""
    var 本卦下 = ""
    var 變卦上 = ""
    var 變卦下 = ""
    var 本卦世 = ""
    var 變卦世 = ""
    @IBOutlet weak var 年干支: UILabel!
    @IBOutlet weak var 月干支: UILabel!
    @IBOutlet weak var 日干支: UILabel!
    @IBOutlet weak var 時干支: UILabel!
    @IBOutlet weak var 本卦名: UILabel!
    @IBOutlet weak var 變卦名: UILabel!
    @IBOutlet weak var 本1: UILabel!
    @IBOutlet weak var 本2: UILabel!
    @IBOutlet weak var 本3: UILabel!
    @IBOutlet weak var 本4: UILabel!
    @IBOutlet weak var 本5: UILabel!
    @IBOutlet weak var 本6: UILabel!
    @IBOutlet weak var 變1: UILabel!
    @IBOutlet weak var 變2: UILabel!
    @IBOutlet weak var 變3: UILabel!
    @IBOutlet weak var 變4: UILabel!
    @IBOutlet weak var 變5: UILabel!
    @IBOutlet weak var 變6: UILabel!

    @IBOutlet weak var 本一爻親: UILabel!
    @IBOutlet weak var 本二爻親: UILabel!
    @IBOutlet weak var 本三爻親: UILabel!
    @IBOutlet weak var 本四爻親: UILabel!
    @IBOutlet weak var 本五爻親: UILabel!
    @IBOutlet weak var 本六爻親: UILabel!
    
    @IBOutlet weak var 本一爻: UILabel!
    @IBOutlet weak var 本二爻: UILabel!
    @IBOutlet weak var 本三爻: UILabel!
    @IBOutlet weak var 本四爻: UILabel!
    @IBOutlet weak var 本五爻: UILabel!
    @IBOutlet weak var 本六爻: UILabel!

    @IBOutlet weak var 變一爻親: UILabel!
    @IBOutlet weak var 變二爻親: UILabel!
    @IBOutlet weak var 變三爻親: UILabel!
    @IBOutlet weak var 變四爻親: UILabel!
    @IBOutlet weak var 變五爻親: UILabel!
    @IBOutlet weak var 變六爻親: UILabel!
    
    @IBOutlet weak var 變一爻: UILabel!
    @IBOutlet weak var 變二爻: UILabel!
    @IBOutlet weak var 變三爻: UILabel!
    @IBOutlet weak var 變四爻: UILabel!
    @IBOutlet weak var 變五爻: UILabel!
    @IBOutlet weak var 變六爻: UILabel!
    
    @IBOutlet weak var 爻一動: UILabel!
    @IBOutlet weak var 爻二動: UILabel!
    @IBOutlet weak var 爻三動: UILabel!
    @IBOutlet weak var 爻四動: UILabel!
    @IBOutlet weak var 爻五動: UILabel!
    @IBOutlet weak var 爻六動: UILabel!
    
    @IBOutlet weak var 世應一: UILabel!
    @IBOutlet weak var 世應二: UILabel!
    @IBOutlet weak var 世應三: UILabel!
    @IBOutlet weak var 世應四: UILabel!
    @IBOutlet weak var 世應五: UILabel!
    @IBOutlet weak var 世應六: UILabel!
    @IBOutlet weak var 六獸一: UILabel!
    @IBOutlet weak var 六獸二: UILabel!
    @IBOutlet weak var 六獸三: UILabel!
    @IBOutlet weak var 六獸四: UILabel!
    @IBOutlet weak var 六獸五: UILabel!
    @IBOutlet weak var 六獸六: UILabel!
    @IBOutlet weak var 伏神一: UILabel!
    @IBOutlet weak var 伏神二: UILabel!
    @IBOutlet weak var 伏神三: UILabel!
    @IBOutlet weak var 伏神四: UILabel!
    @IBOutlet weak var 伏神五: UILabel!
    @IBOutlet weak var 伏神六: UILabel!
    @IBOutlet weak var 貴人: UILabel!
    @IBOutlet weak var 祿神: UILabel!
    @IBOutlet weak var 驛馬: UILabel!
    @IBOutlet weak var 陽刃: UILabel!
    @IBOutlet weak var 桃花: UILabel!
    @IBOutlet weak var 劫煞: UILabel!
    @IBOutlet weak var 旬空: UILabel!
    @IBOutlet weak var 卦身: UILabel!
    @IBOutlet weak var 世身: UILabel!
    @IBOutlet weak var 本宮遊歸: UILabel!
    @IBOutlet weak var 變宮遊歸: UILabel!
    @IBOutlet weak var 本空一: UILabel!
    @IBOutlet weak var 本空二: UILabel!
    @IBOutlet weak var 本空三: UILabel!
    @IBOutlet weak var 本空四: UILabel!
    @IBOutlet weak var 本空五: UILabel!
    @IBOutlet weak var 本空六: UILabel!
    @IBOutlet weak var 變空一: UILabel!
    @IBOutlet weak var 變空二: UILabel!
    @IBOutlet weak var 變空三: UILabel!
    @IBOutlet weak var 變空四: UILabel!
    @IBOutlet weak var 變空五: UILabel!
    @IBOutlet weak var 變空六: UILabel!
    @IBOutlet weak var 起卦時間: UILabel!
    @IBOutlet weak var 現在: UILabel!
    @IBOutlet weak var 事由: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch delegate.n命卦n{
        case 1,2,3:
            排卦(數字1: 命卦n[0], 數字2: 命卦n[1])
        default:
            break
        }
        起卦時間.text = "起卦 西元:"+usdata[2]+"年"+usdata[3]+"月"+usdata[4]+"日"+usdata[5]+"時"+usdata[6]+"分"
        if thing != "" {事由.text = thing}
        //    let fo = DateFormatter.self
        //    fo.dateFormat = "yyyy/M/d H:m:s"
        let f0 = DateFormatter()
        f0.dateFormat = "yyyy"
        nowday[0] = f0.string(from: Date())
        let f1 = DateFormatter()
        f1.dateFormat = "M"
        nowday[1] = f1.string(from: Date())
        let f2 = DateFormatter()
        f2.dateFormat = "d"
        nowday[2] = f2.string(from: Date())
        let f3 = DateFormatter()
        f3.dateFormat = "H"
        nowday[3] = f3.string(from: Date())
        let f4 = DateFormatter()
        f4.dateFormat = "m"
        nowday[4] = f4.string(from: Date())
        現在.text = "現在 西元:"+nowday[0]+"年"+nowday[1]+"月"+nowday[2]+"日"+nowday[3]+"時"+nowday[4]+"分"

        // Do any additional setup after loading the view.
    }
//------------------------------------------------------------------
    func 排卦(數字1: Int, 數字2: Int){
        var 本卦 = [String]()
        var 變卦 = [String]()
        var 本卦0 = [String]()
        var 本卦1 = [String]()
        var 變卦0 = [String]()
        var 變卦1 = [String]()
        變卦名.isHidden = false
        變1.isHidden = false
        變2.isHidden = false
        變3.isHidden = false
        變4.isHidden = false
        變5.isHidden = false
        變6.isHidden = false
        變一爻.isHidden = false
        變二爻.isHidden = false
        變三爻.isHidden = false
        變四爻.isHidden = false
        變五爻.isHidden = false
        變六爻.isHidden = false
        變一爻親.isHidden = false
        變二爻親.isHidden = false
        變三爻親.isHidden = false
        變四爻親.isHidden = false
        變五爻親.isHidden = false
        變六爻親.isHidden = false
        爻一動.isHidden = false
        爻二動.isHidden = false
        爻三動.isHidden = false
        爻四動.isHidden = false
        爻五動.isHidden = false
        爻六動.isHidden = false
        本卦名.text = egn0[數字1]
        變卦名.text = egn0[數字2]
        switch 本卦名.text{
        case "火地晉"?,"雷山小過"?,"天水訟"?,"澤風大過"?,"山雷頤"?,"地火明夷"?,"風澤中孚"?,"水天需"?:
            本宮遊歸.text = "遊魂卦"
        case "火天大有"?,"雷澤歸妹"?,"天火同人"?,"澤雷隨"?,"山風蠱"?,"地水師"?,"風山漸"?,"水地比"?:
            本宮遊歸.text = "歸魂卦"
        default:
            break
        }
        switch 變卦名.text{
        case "火地晉"?,"雷山小過"?,"天水訟"?,"澤風大過"?,"山雷頤"?,"地火明夷"?,"風澤中孚"?,"水天需"?:
            變宮遊歸.text = "遊魂卦"
        case "火天大有"?,"雷澤歸妹"?,"天火同人"?,"澤雷隨"?,"山風蠱"?,"地水師"?,"風山漸"?,"水地比"?:
            變宮遊歸.text = "歸魂卦"
        default:
            break
        }
        本卦世 = String(數字1 % 8)
        變卦世 = String(數字2 % 8)
        本卦宮 = egn8[(數字1 / 8)]
        變卦宮 = egn8[(數字2 / 8)]
        var e0 = myfunc1(卦: egn0[數字1])
        var e1 = myfunc1(卦: egn0[數字2])
        本卦上 = e0[0]
        本卦下 = e0[1] == "為" ? e0[0] : e0[1]
        變卦上 = e1[0]
        變卦下 = e1[1] == "為" ? e1[0] : e1[1]
        e0[0] = 本卦上
        e0[1] = 本卦下
        e1[0] = 變卦上
        e1[1] = 變卦下
        年干支.text = bz[1]
        月干支.text = bz[2]
        日干支.text = bz[3]
        時干支.text = bz[4]
        switch e0[0]{
        case "乾","天":
            本卦0 = egn1[0]
            本四爻.text = "午"
            本五爻.text = "申"
            本六爻.text = "戌"
        case "兌","澤":
            本卦0 = egn1[1]
            本四爻.text = "亥"
            本五爻.text = "酉"
            本六爻.text = "未"
        case "離","火":
            本卦0 = egn1[2]
            本四爻.text = "酉"
            本五爻.text = "未"
            本六爻.text = "巳"
        case "震","雷":
            本卦0 = egn1[3]
            本四爻.text = "午"
            本五爻.text = "申"
            本六爻.text = "戌"
        case "巽","風":
            本卦0 = egn1[4]
            本四爻.text = "未"
            本五爻.text = "巳"
            本六爻.text = "卯"
        case "坎","水":
            本卦0 = egn1[5]
            本四爻.text = "申"
            本五爻.text = "戌"
            本六爻.text = "子"
        case "艮","山":
            本卦0 = egn1[6]
            本四爻.text = "戌"
            本五爻.text = "子"
            本六爻.text = "寅"
        case "坤","地":
            本卦0 = egn1[7]
            本四爻.text = "丑"
            本五爻.text = "亥"
            本六爻.text = "酉"
        default:
            break
        }
        switch e0[1]{
        case "乾","天":
            本卦1 = egn1[0]
            本一爻.text = "子"
            本二爻.text = "寅"
            本三爻.text = "辰"
        case "兌","澤":
            本卦1 = egn1[1]
            本一爻.text = "巳"
            本二爻.text = "卯"
            本三爻.text = "丑"
        case "離","火":
            本卦1 = egn1[2]
            本一爻.text = "卯"
            本二爻.text = "丑"
            本三爻.text = "亥"
        case "震","雷":
            本卦1 = egn1[3]
            本一爻.text = "子"
            本二爻.text = "寅"
            本三爻.text = "辰"
        case "巽","風":
            本卦1 = egn1[4]
            本一爻.text = "丑"
            本二爻.text = "亥"
            本三爻.text = "酉"
        case "坎","水":
            本卦1 = egn1[5]
            本一爻.text = "寅"
            本二爻.text = "辰"
            本三爻.text = "午"
        case "艮","山":
            本卦1 = egn1[6]
            本一爻.text = "辰"
            本二爻.text = "午"
            本三爻.text = "申"
        case "坤","地":
            本卦1 = egn1[7]
            本一爻.text = "未"
            本二爻.text = "巳"
            本三爻.text = "卯"
        default:
            break
        }
        switch e1[0]{
        case "乾","天":
            變卦0 = egn1[0]
            變四爻.text = "午"
            變五爻.text = "申"
            變六爻.text = "戌"
        case "兌","澤":
            變卦0 = egn1[1]
            變四爻.text = "亥"
            變五爻.text = "酉"
            變六爻.text = "未"
        case "離","火":
            變卦0 = egn1[2]
            變四爻.text = "酉"
            變五爻.text = "未"
            變六爻.text = "巳"
        case "震","雷":
            變卦0 = egn1[3]
            變四爻.text = "午"
            變五爻.text = "申"
            變六爻.text = "戌"
        case "巽","風":
            變卦0 = egn1[4]
            變四爻.text = "未"
            變五爻.text = "巳"
            變六爻.text = "卯"
        case "坎","水":
            變卦0 = egn1[5]
            變四爻.text = "申"
            變五爻.text = "戌"
            變六爻.text = "子"
        case "艮","山":
            變卦0 = egn1[6]
            變四爻.text = "戌"
            變五爻.text = "子"
            變六爻.text = "寅"
        case "坤","地":
            變卦0 = egn1[7]
            變四爻.text = "丑"
            變五爻.text = "亥"
            變六爻.text = "酉"
        default:
            break
        }
        switch e1[1]{
        case "乾","天":
            變卦1 = egn1[0]
            變一爻.text = "子"
            變二爻.text = "寅"
            變三爻.text = "辰"
        case "兌","澤":
            變卦1 = egn1[1]
            變一爻.text = "巳"
            變二爻.text = "卯"
            變三爻.text = "丑"
        case "離","火":
            變卦1 = egn1[2]
            變一爻.text = "卯"
            變二爻.text = "丑"
            變三爻.text = "亥"
        case "震","雷":
            變卦1 = egn1[3]
            變一爻.text = "子"
            變二爻.text = "寅"
            變三爻.text = "辰"
        case "巽","風":
            變卦1 = egn1[4]
            變一爻.text = "丑"
            變二爻.text = "亥"
            變三爻.text = "酉"
        case "坎","水":
            變卦1 = egn1[5]
            變一爻.text = "寅"
            變二爻.text = "辰"
            變三爻.text = "午"
        case "艮","山":
            變卦1 = egn1[6]
            變一爻.text = "辰"
            變二爻.text = "午"
            變三爻.text = "申"
        case "坤","地":
            變卦1 = egn1[7]
            變一爻.text = "未"
            變二爻.text = "巳"
            變三爻.text = "卯"
        default:
            break
        }
        本卦 = 本卦1 + 本卦0
        變卦 = 變卦1 + 變卦0
        本1.text = 本卦[2]
        本2.text = 本卦[1]
        本3.text = 本卦[0]
        本4.text = 本卦[5]
        本5.text = 本卦[4]
        本6.text = 本卦[3]
        變1.text = 變卦[2]
        變2.text = 變卦[1]
        變3.text = 變卦[0]
        變4.text = 變卦[5]
        變5.text = 變卦[4]
        變6.text = 變卦[3]
        if(本1.text != 變1.text){
            if(本1.text == "-----"){
                本卦[2] = "- o -"
                本1.text = "- o -"
//                變一爻親.isHidden = false
//                變空一.isHidden = false
            }
            if(本1.text == "--  --"){
                本卦[2] = "- x -"
                本1.text = "- x -"
//                變一爻親.isHidden = false
//                變空一.isHidden = false
            }
        }
        if(本2.text != 變2.text){
            if(本2.text == "-----"){
                本卦[1] = "- o -"
                本2.text = "- o -"
//                變二爻親.isHidden = false
//                變空二.isHidden = false
            }
            if(本2.text == "--  --"){
                本卦[1] = "- x -"
                本2.text = "- x -"
//                變二爻親.isHidden = false
//                變空二.isHidden = false
            }
        }
        if(本3.text != 變3.text){
            if(本3.text == "-----"){
                本卦[0] = "- o -"
                本3.text = "- o -"
//                變三爻親.isHidden = false
//                變空三.isHidden = false
            }
            if(本3.text == "--  --"){
                本卦[0] = "- x -"
                本3.text = "- x -"
//                變三爻親.isHidden = false
//                變空三.isHidden = false
            }
        }
        if(本4.text != 變4.text){
            if(本4.text == "-----"){
                本卦[5] = "- o -"
                本4.text = "- o -"
//                變四爻親.isHidden = false
//                變空四.isHidden = false
            }
            if(本4.text == "--  --"){
                本卦[5] = "- x -"
                本4.text = "- x -"
//                變四爻親.isHidden = false
//                變空四.isHidden = false
            }
        }
        if(本5.text != 變5.text){
            if(本5.text == "-----"){
                本卦[4] = "- o -"
                本5.text = "- o -"
//                變五爻親.isHidden = false
//                變空五.isHidden = false
            }
            if(本5.text == "--  --"){
                本卦[4] = "- x -"
                本5.text = "- x -"
//                變五爻親.isHidden = false
//                變空五.isHidden = false
            }
        }
        if(本6.text != 變6.text){
            if(本6.text == "-----"){
                本卦[3] = "- o -"
                本6.text = "- o -"
//                變六爻親.isHidden = false
//                變空六.isHidden = false
            }
            if(本6.text == "--  --"){
                本卦[3] = "- x -"
                本6.text = "- x -"
//                變六爻親.isHidden = false
//                變空六.isHidden = false
            }
        }
        if(本1.text == "- o -" || 本1.text == "- x -"){爻一動.text = "->"}else{爻一動.text = ""}
        if(本2.text == "- o -" || 本2.text == "- x -"){爻二動.text = "->"}else{爻二動.text = ""}
        if(本3.text == "- o -" || 本3.text == "- x -"){爻三動.text = "->"}else{爻三動.text = ""}
        if(本4.text == "- o -" || 本4.text == "- x -"){爻四動.text = "->"}else{爻四動.text = ""}
        if(本5.text == "- o -" || 本5.text == "- x -"){爻五動.text = "->"}else{爻五動.text = ""}
        if(本6.text == "- o -" || 本6.text == "- x -"){爻六動.text = "->"}else{爻六動.text = ""}
        
        本一爻親.text = 六親[wusin[本卦宮]! + wusin[本一爻.text!]!]
        本二爻親.text = 六親[wusin[本卦宮]! + wusin[本二爻.text!]!]
        本三爻親.text = 六親[wusin[本卦宮]! + wusin[本三爻.text!]!]
        本四爻親.text = 六親[wusin[本卦宮]! + wusin[本四爻.text!]!]
        本五爻親.text = 六親[wusin[本卦宮]! + wusin[本五爻.text!]!]
        本六爻親.text = 六親[wusin[本卦宮]! + wusin[本六爻.text!]!]
        變一爻親.text = 六親[wusin[本卦宮]! + wusin[變一爻.text!]!]
        變二爻親.text = 六親[wusin[本卦宮]! + wusin[變二爻.text!]!]
        變三爻親.text = 六親[wusin[本卦宮]! + wusin[變三爻.text!]!]
        變四爻親.text = 六親[wusin[本卦宮]! + wusin[變四爻.text!]!]
        變五爻親.text = 六親[wusin[本卦宮]! + wusin[變五爻.text!]!]
        變六爻親.text = 六親[wusin[本卦宮]! + wusin[變六爻.text!]!]
        
        switch 本卦世{
        case "0":
            世應一.text = ""
            世應二.text = ""
            世應三.text = "應"
            世應四.text = ""
            世應五.text = ""
            世應六.text = "世"
            switch 本6.text{
            case "-----"?,"- o -"?:
                卦身.text = "巳"
            case "--  --"?,"- x -"?:
                卦身.text = "亥"
            default:
                break
            }
            switch 本六爻.text{
            case "子"?,"午"?:
                世身.text = 本一爻.text
            case "丑"?,"未"?:
                世身.text = 本二爻.text
            case "寅"?,"申"?:
                世身.text = 本三爻.text
            case "卯"?,"酉"?:
                世身.text = 本四爻.text
            case "辰"?,"戌"?:
                世身.text = 本五爻.text
            case "巳"?,"亥"?:
                世身.text = 本六爻.text
            default:
                break
            }
        case "1":
            世應一.text = "世"
            世應二.text = ""
            世應三.text = ""
            世應四.text = "應"
            世應五.text = ""
            世應六.text = ""
            switch 本1.text{
            case "-----"?,"- o -"?:
                卦身.text = "子"
            case "--  --"?,"- x -"?:
                卦身.text = "午"
            default:
                break
            }
            switch 本一爻.text{
            case "子"?,"午"?:
                世身.text = 本一爻.text
            case "丑"?,"未"?:
                世身.text = 本二爻.text
            case "寅"?,"申"?:
                世身.text = 本三爻.text
            case "卯"?,"酉"?:
                世身.text = 本四爻.text
            case "辰"?,"戌"?:
                世身.text = 本五爻.text
            case "巳"?,"亥"?:
                世身.text = 本六爻.text
            default:
                break
            }
        case "2":
            世應一.text = ""
            世應二.text = "世"
            世應三.text = ""
            世應四.text = ""
            世應五.text = "應"
            世應六.text = ""
            switch 本2.text{
            case "-----"?,"- o -"?:
                卦身.text = "丑"
            case "--  --"?,"- x -"?:
                卦身.text = "未"
            default:
                break
            }
            switch 本二爻.text{
            case "子"?,"午"?:
                世身.text = 本一爻.text
            case "丑"?,"未"?:
                世身.text = 本二爻.text
            case "寅"?,"申"?:
                世身.text = 本三爻.text
            case "卯"?,"酉"?:
                世身.text = 本四爻.text
            case "辰"?,"戌"?:
                世身.text = 本五爻.text
            case "巳"?,"亥"?:
                世身.text = 本六爻.text
            default:
                break
            }
        case "3":
            世應一.text = ""
            世應二.text = ""
            世應三.text = "世"
            世應四.text = ""
            世應五.text = ""
            世應六.text = "應"
            switch 本3.text{
            case "-----"?,"- o -"?:
                卦身.text = "寅"
            case "--  --"?,"- x -"?:
                卦身.text = "申"
            default:
                break
            }
            switch 本三爻.text{
            case "子"?,"午"?:
                世身.text = 本一爻.text
            case "丑"?,"未"?:
                世身.text = 本二爻.text
            case "寅"?,"申"?:
                世身.text = 本三爻.text
            case "卯"?,"酉"?:
                世身.text = 本四爻.text
            case "辰"?,"戌"?:
                世身.text = 本五爻.text
            case "巳"?,"亥"?:
                世身.text = 本六爻.text
            default:
                break
            }
        case "4":
            世應一.text = "應"
            世應二.text = ""
            世應三.text = ""
            世應四.text = "世"
            世應五.text = ""
            世應六.text = ""
            switch 本4.text{
            case "-----"?,"- o -"?:
                卦身.text = "卯"
            case "--  --"?,"- x -"?:
                卦身.text = "酉"
            default:
                break
            }
            switch 本四爻.text{
            case "子"?,"午"?:
                世身.text = 本一爻.text
            case "丑"?,"未"?:
                世身.text = 本二爻.text
            case "寅"?,"申"?:
                世身.text = 本三爻.text
            case "卯"?,"酉"?:
                世身.text = 本四爻.text
            case "辰"?,"戌"?:
                世身.text = 本五爻.text
            case "巳"?,"亥"?:
                世身.text = 本六爻.text
            default:
                break
            }
        case "5":
            世應一.text = ""
            世應二.text = "應"
            世應三.text = ""
            世應四.text = ""
            世應五.text = "世"
            世應六.text = ""
            switch 本5.text{
            case "-----"?,"- o -"?:
                卦身.text = "辰"
            case "--  --"?,"- x -"?:
                卦身.text = "戌"
            default:
                break
            }
            switch 本五爻.text{
            case "子"?,"午"?:
                世身.text = 本一爻.text
            case "丑"?,"未"?:
                世身.text = 本二爻.text
            case "寅"?,"申"?:
                世身.text = 本三爻.text
            case "卯"?,"酉"?:
                世身.text = 本四爻.text
            case "辰"?,"戌"?:
                世身.text = 本五爻.text
            case "巳"?,"亥"?:
                世身.text = 本六爻.text
            default:
                break
            }
        case "6":
            世應一.text = "應"
            世應二.text = ""
            世應三.text = ""
            世應四.text = "世"
            世應五.text = ""
            世應六.text = ""
            switch 本4.text{
            case "-----"?,"- o -"?:
                卦身.text = "卯"
            case "--  --"?,"- x -"?:
                卦身.text = "酉"
            default:
                break
            }
            switch 本四爻.text{
            case "子"?,"午"?:
                世身.text = 本一爻.text
            case "丑"?,"未"?:
                世身.text = 本二爻.text
            case "寅"?,"申"?:
                世身.text = 本三爻.text
            case "卯"?,"酉"?:
                世身.text = 本四爻.text
            case "辰"?,"戌"?:
                世身.text = 本五爻.text
            case "巳"?,"亥"?:
                世身.text = 本六爻.text
            default:
                break
            }
        case "7":
            世應一.text = ""
            世應二.text = ""
            世應三.text = "世"
            世應四.text = ""
            世應五.text = ""
            世應六.text = "應"
            switch 本3.text{
            case "-----"?,"- o -"?:
                卦身.text = "寅"
            case "--  --"?,"- x -"?:
                卦身.text = "申"
            default:
                break
            }
            switch 本三爻.text{
            case "子"?,"午"?:
                世身.text = 本一爻.text
            case "丑"?,"未"?:
                世身.text = 本二爻.text
            case "寅"?,"申"?:
                世身.text = 本三爻.text
            case "卯"?,"酉"?:
                世身.text = 本四爻.text
            case "辰"?,"戌"?:
                世身.text = 本五爻.text
            case "巳"?,"亥"?:
                世身.text = 本六爻.text
            default:
                break
            }
        default:
            break
        }
        var my五行 = [0,0,0,0,0]
        switch wusin[本一爻.text!] {
        case "金"?:
            my五行[0] = my五行[0] + 1
        case "木"?:
            my五行[1] = my五行[1] + 1
        case "水"?:
            my五行[2] = my五行[2] + 1
        case "火"?:
            my五行[3] = my五行[3] + 1
        case "土"?:
            my五行[4] = my五行[4] + 1
        default:
            break
        }
        switch wusin[本二爻.text!] {
        case "金"?:
            my五行[0] = my五行[0] + 1
        case "木"?:
            my五行[1] = my五行[1] + 1
        case "水"?:
            my五行[2] = my五行[2] + 1
        case "火"?:
            my五行[3] = my五行[3] + 1
        case "土"?:
            my五行[4] = my五行[4] + 1
        default:
            break
        }
        switch wusin[本三爻.text!] {
        case "金"?:
            my五行[0] = my五行[0] + 1
        case "木"?:
            my五行[1] = my五行[1] + 1
        case "水"?:
            my五行[2] = my五行[2] + 1
        case "火"?:
            my五行[3] = my五行[3] + 1
        case "土"?:
            my五行[4] = my五行[4] + 1
        default:
            break
        }
        switch wusin[本四爻.text!] {
        case "金"?:
            my五行[0] = my五行[0] + 1
        case "木"?:
            my五行[1] = my五行[1] + 1
        case "水"?:
            my五行[2] = my五行[2] + 1
        case "火"?:
            my五行[3] = my五行[3] + 1
        case "土"?:
            my五行[4] = my五行[4] + 1
        default:
            break
        }
        switch wusin[本五爻.text!] {
        case "金"?:
            my五行[0] = my五行[0] + 1
        case "木"?:
            my五行[1] = my五行[1] + 1
        case "水"?:
            my五行[2] = my五行[2] + 1
        case "火"?:
            my五行[3] = my五行[3] + 1
        case "土"?:
            my五行[4] = my五行[4] + 1
        default:
            break
        }
        switch wusin[本六爻.text!] {
        case "金"?:
            my五行[0] = my五行[0] + 1
        case "木"?:
            my五行[1] = my五行[1] + 1
        case "水"?:
            my五行[2] = my五行[2] + 1
        case "火"?:
            my五行[3] = my五行[3] + 1
        case "土"?:
            my五行[4] = my五行[4] + 1
        default:
            break
        }
        var 缺五行 = [String]()
        var myw = ""
        if(my五行[0] == 0){
            缺五行.append("金")
            myw = myw + "金"
        }
        if(my五行[1] == 0){
            缺五行.append("木")
            myw = myw + "木"
        }
        if(my五行[2] == 0){
            缺五行.append("水")
            myw = myw + "水"
        }
        if(my五行[3] == 0){
            缺五行.append("火")
            myw = myw + "火"
        }
        if(my五行[4] == 0){
            缺五行.append("土")
            myw = myw + "土"
        }
        var 伏神 = [String]()
        switch 本卦宮{
        case "乾":
            伏神 = 地支12[0]
        case "兌":
            伏神 = 地支12[1]
        case "離":
            伏神 = 地支12[2]
        case "震":
            伏神 = 地支12[3]
        case "巽":
            伏神 = 地支12[4]
        case "坎":
            伏神 = 地支12[5]
        case "艮":
            伏神 = 地支12[6]
        case "坤":
            伏神 = 地支12[7]
        default:
            break
        }
        var 伏神num = [Int]()
        for ii in 0..<缺五行.count{
            for jj in 0...5{
                if (缺五行[ii] == wusin[伏神[jj]]){
                    伏神num.append(jj)
                }
            }
        }
        伏神一.text = ""
        伏神二.text = ""
        伏神三.text = ""
        伏神四.text = ""
        伏神五.text = ""
        伏神六.text = ""
        var mm = ""
        for aa in 0..<伏神num.count{
            mm = mm + String(伏神num[aa])
            switch 伏神num[aa]{
            case 0:
                伏神一.text = 六親[wusin[本卦宮]! + wusin[伏神[0]]!]! + 伏神[0]
            case 1:
                伏神二.text = 六親[wusin[本卦宮]! + wusin[伏神[1]]!]! + 伏神[1]
            case 2:
                伏神三.text = 六親[wusin[本卦宮]! + wusin[伏神[2]]!]! + 伏神[2]
            case 3:
                伏神四.text = 六親[wusin[本卦宮]! + wusin[伏神[3]]!]! + 伏神[3]
            case 4:
                伏神五.text = 六親[wusin[本卦宮]! + wusin[伏神[4]]!]! + 伏神[4]
            case 5:
                伏神六.text = 六親[wusin[本卦宮]! + wusin[伏神[5]]!]! + 伏神[5]
            default:
                break
            }//switch
        }//for
        
        switch tgDg[4]{
        case "甲","戊":
            貴人.text = "丑未"
        case "乙","己":
            貴人.text = "子申"
        case "丙","丁":
            貴人.text = "亥酉"
        case "壬","癸":
            貴人.text = "卯巳"
        case "庚","辛":
            貴人.text = "寅午"
        default:
            break
        }
        switch tgDg[4]{
        case "甲","乙":
            六獸一.text = "龍"
            六獸二.text = "雀"
            六獸三.text = "陳"
            六獸四.text = "蛇"
            六獸五.text = "虎"
            六獸六.text = "武"
        case "丙","丁":
            六獸一.text = "雀"
            六獸二.text = "陳"
            六獸三.text = "蛇"
            六獸四.text = "虎"
            六獸五.text = "武"
            六獸六.text = "龍"
        case "戊":
            六獸一.text = "陳"
            六獸二.text = "蛇"
            六獸三.text = "虎"
            六獸四.text = "武"
            六獸五.text = "龍"
            六獸六.text = "雀"
        case "己":
            六獸一.text = "蛇"
            六獸二.text = "虎"
            六獸三.text = "武"
            六獸四.text = "龍"
            六獸五.text = "雀"
            六獸六.text = "陳"
        case "庚","辛":
            六獸一.text = "虎"
            六獸二.text = "武"
            六獸三.text = "龍"
            六獸四.text = "雀"
            六獸五.text = "陳"
            六獸六.text = "蛇"
        case "壬","癸":
            六獸一.text = "武"
            六獸二.text = "龍"
            六獸三.text = "雀"
            六獸四.text = "陳"
            六獸五.text = "蛇"
            六獸六.text = "虎"
        default:
            break
        }
        switch tgDg[4]{
        case "甲":
            祿神.text = "寅"
            陽刃.text = "卯"
        case "乙":
            祿神.text = "卯"
            陽刃.text = "辰"
        case "丙":
            祿神.text = "巳"
            陽刃.text = "午"
        case "丁":
            祿神.text = "午"
            陽刃.text = "未"
        case "戊":
            祿神.text = "巳"
            陽刃.text = "午"
        case "己":
            祿神.text = "午"
            陽刃.text = "未"
        case "庚":
            祿神.text = "申"
            陽刃.text = "酉"
        case "辛":
            祿神.text = "酉"
            陽刃.text = "戌"
        case "壬":
            祿神.text = "亥"
            陽刃.text = "子"
        case "癸":
            祿神.text = "子"
            陽刃.text = "丑"
        default:
            break
        }
        switch tgDg[5]{
        case "申","子","辰":
            驛馬.text = "寅"
            桃花.text = "酉"
            劫煞.text = "巳"
        case "亥","卯","未":
            驛馬.text = "巳"
            桃花.text = "子"
            劫煞.text = "申"
        case "寅","午","戌":
            驛馬.text = "申"
            桃花.text = "卯"
            劫煞.text = "亥"
        case "巳","酉","丑":
            驛馬.text = "亥"
            桃花.text = "午"
            劫煞.text = "寅"
        default:
            break
        }
        
        let 旬空n = my.artsha(旬空: 旬空0, 年干: tt.index(of: tgDg[4])!, 年干支: bz[3])
        switch 旬空n{
        case 0:
            旬空.text = "戌亥"
            旬空1[0] = "戌"
            旬空1[1] = "亥"
        case 1:
            旬空.text = "申酉"
            旬空1[0] = "申"
            旬空1[1] = "酉"
        case 2:
            旬空.text = "午未"
            旬空1[0] = "午"
            旬空1[1] = "未"
        case 3:
            旬空.text = "辰巳"
            旬空1[0] = "辰"
            旬空1[1] = "巳"
        case 4:
            旬空.text = "寅卯"
            旬空1[0] = "寅"
            旬空1[1] = "卯"
        case 5:
            旬空.text = "子丑"
            旬空1[0] = "子"
            旬空1[1] = "丑"
        default:
            break
        }
        
        if(本一爻.text == 旬空1[0] || 本一爻.text == 旬空1[1]){本空一.text = "空"}
        if(本二爻.text == 旬空1[0] || 本二爻.text == 旬空1[1]){本空二.text = "空"}
        if(本三爻.text == 旬空1[0] || 本三爻.text == 旬空1[1]){本空三.text = "空"}
        if(本四爻.text == 旬空1[0] || 本四爻.text == 旬空1[1]){本空四.text = "空"}
        if(本五爻.text == 旬空1[0] || 本五爻.text == 旬空1[1]){本空五.text = "空"}
        if(本六爻.text == 旬空1[0] || 本六爻.text == 旬空1[1]){本空六.text = "空"}
        if(變一爻.text == 旬空1[0] || 變一爻.text == 旬空1[1]){變空一.text = "空"}
        if(變二爻.text == 旬空1[0] || 變二爻.text == 旬空1[1]){變空二.text = "空"}
        if(變三爻.text == 旬空1[0] || 變三爻.text == 旬空1[1]){變空三.text = "空"}
        if(變四爻.text == 旬空1[0] || 變四爻.text == 旬空1[1]){變空四.text = "空"}
        if(變五爻.text == 旬空1[0] || 變五爻.text == 旬空1[1]){變空五.text = "空"}
        if(變六爻.text == 旬空1[0] || 變六爻.text == 旬空1[1]){變空六.text = "空"}

        變三爻親.text = 六親[wusin[本卦宮]! + wusin[變三爻.text!]!]
    }//func 排卦
    func myfunc1(卦:String)->[String]{
        var aa = ["",""]
        let b0 = 卦.index(卦.startIndex,offsetBy:1)
        let b1:String = 卦.substring(to: b0)//年天干
        aa[0] = b1
        let b2:String = 卦.substring(from: b0)//年地支
        let c0 = b2.index(b2.startIndex,offsetBy:1)
        let c1:String = b2.substring(to: c0)//年天干
        aa[1] = c1
        return aa
    }
//-------------------------------------------------------------
    @IBAction func 回首頁(_ sender: UIButton) {
        if let vc  = storyboard?.instantiateViewController(withIdentifier: "homeVc"){
            show(vc, sender: self)
        }
    }
    @IBAction func 手動起卦(_ sender: UIButton) {
        if let vc  = storyboard?.instantiateViewController(withIdentifier: "handVc"){
            show(vc, sender: self)
        }

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
