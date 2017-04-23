//
//  handVc.swift
//  E-gin
//
//  Created by Mac on 2017/3/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class handVc: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
let delegate = UIApplication.shared.delegate as! AppDelegate
    
    let tt = ["甲","乙","丙","丁","戊","己","庚","辛","壬","癸"]
    var ww:String = ""
    var 農曆月 = ""
    var 農曆日 = ""
    var 農曆 = [0,0]
    var list = [String]()
    var 命卦n = [0,0]
    var data2 = [0,0]
    var bz = ["","","","","",""]
    var usdata = ["","","","","","",""]
    var thing = ""
    let dd = ["子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥"]
    let egn8 = ["乾","兌","離","震","巽","坎","艮","坤"]
    let tm0 = ["甲","丙","戊","庚","壬","甲","丙","戊","庚","壬"]
    var tgDg = ["","","","","","","",""]//四柱的八個天干地支
    let egn0 = ["乾為天","天風姤","天山遯","天地否","風地觀","山地剝","火地晉","火天大有","兌為澤","澤水困","澤地萃","澤山咸","水山蹇","地山謙","雷山小過","雷澤歸妹","離為火","火山旅","火風鼎","火水未濟","山水蒙","風水渙","天水訟","天火同人","震為雷","雷地豫","雷水解","雷風恆","地風升","水風井","澤風大過","澤雷隨","巽為風","風天小畜","風火家人","風雷益","天雷無妄","火雷嗜嗑","山雷頤","山風蠱","坎為水","水澤節","水雷屯","水火既濟","澤火革","雷火豐","地火明夷","地水師","艮為山","山火賁","山天大畜","山澤損","火澤睽","天澤履","風澤中孚","風山漸","坤為地","地雷復","地澤臨","地天泰","雷天大壯","澤天夬","水天需","水地比"]
    let egn01 = ["乾乾","乾巽","乾艮","乾坤","巽坤","艮坤","離坤","離乾","兌兌","兌坎","兌地","兌艮","坎艮","坤艮","震艮","震兌","離離","離艮","離巽","離坎","艮坎","巽坎","乾坎","乾離","震震","震坤","震坎","震巽","坤巽","坎巽","兌巽","兌震","巽巽","巽乾","巽離","巽震","乾震","離震","艮震","艮巽","坎坎","坎兌","坎震","坎離","兌離","震離","坤離","坤坎","艮艮","艮離","艮乾","艮兌","離兌","乾兌","巽兌","巽艮","坤坤","坤震","坤兌","坤乾","震乾","兌乾","坎乾","坎坤"]

    struct TD {
        var id:Int32
        var sunYr:Int32
        var sunMon:Int32
        var sunDay:Int32
        var tdYr:String
        var tdMon:String
        var tdHour:Int32
        init(id:Int32, sunYr:Int32, sunMon:Int32, sunDay:Int32, tdYr:String, tdMon:String, tdHour:Int32) {
            self.id = id
            self.sunYr = sunYr
            self.sunMon = sunMon
            self.sunDay = sunDay
            self.tdYr = tdYr
            self.tdMon = tdMon
            self.tdHour = tdHour
        }//init
    }//TD
    struct NM {
        // var sunYear:String
        var Name:String
        var Gender:String
        var Year:Int32
        var Month:Int32
        var Day:Int32
        var Hour:Int32
        var Minute:Int32
        init(Name:String, Gender:String, Year:Int32, Month:Int32, Day:Int32, Hour:Int32, Minute:Int32) {
            self.Name = Name
            self.Gender = Gender
            self.Year = Year
            self.Month = Month
            self.Day = Day
            self.Hour = Hour
            self.Minute = Minute
        }//init
    }//NM
    struct SM {
        var id:Int32
        var sunYear:Int32
        var sunMonth:Int32
        var sunDay:Int32
        var moonMonth:Double
        var moonDay:Int32
        init(id:Int32, sunYear:Int32, sunMonth:Int32, sunDay:Int32, moonMonth:Double, moonDay:Int32) {
            self.id = id
            self.sunYear = sunYear
            self.sunMonth = sunMonth
            self.sunDay = sunDay
            self.moonMonth = moonMonth
            self.moonDay = moonDay
        }//init
    }//SM

    var statement:OpaquePointer? = nil //資料記錄
    var arNM:Array<NM> = [] //存資料的陣列
    var arSM:Array<SM> = [] //存資料的陣列
    var arTD:Array<TD> = []
    
    @IBOutlet weak var 現年: UITextField!
    @IBOutlet weak var 現月: UITextField!
    @IBOutlet weak var 現日: UITextField!
    @IBOutlet weak var 現時: UITextField!
    @IBOutlet weak var 現分: UITextField!
    @IBOutlet weak var p1: UIPickerView!
    @IBOutlet weak var p2: UIPickerView!
    @IBOutlet weak var p3: UIPickerView!
    @IBOutlet weak var p4: UIPickerView!
    @IBOutlet weak var p5: UIPickerView!
    @IBOutlet weak var p6: UIPickerView!
    @IBOutlet weak var 事由: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let f0 = DateFormatter()
        f0.dateFormat = "yyyy"
        現年.text = f0.string(from: Date())
        let f1 = DateFormatter()
        f1.dateFormat = "M"
        現月.text = f1.string(from: Date())
        let f2 = DateFormatter()
        f2.dateFormat = "d"
        現日.text = f2.string(from: Date())
        let f3 = DateFormatter()
        f3.dateFormat = "H"
        現時.text = f3.string(from: Date())
        let f4 = DateFormatter()
        f4.dateFormat = "m"
        現分.text = f4.string(from: Date())
        
        list.append("-----")
        list.append("--  --")
        list.append("- x -")
        list.append("- o -")
        
        // Do any additional setup after loading the view.
    }
    
    func 手卦()->[Int]{
        var aa = [0,0]
        農曆(年: 現年.text!, 月: 現月.text!, 日: 現日.text!, 時: 現時.text!, 分: 現分.text!)
        干支(年: 現年.text!, 月: 現月.text!, 日: 現日.text!, 時: 現時.text!, 分: 現分.text!)
        let pk1 = list[p1.selectedRow(inComponent: 0)]
        let pk2 = list[p2.selectedRow(inComponent: 0)]
        let pk3 = list[p3.selectedRow(inComponent: 0)]
        let pk4 = list[p4.selectedRow(inComponent: 0)]
        let pk5 = list[p5.selectedRow(inComponent: 0)]
        let pk6 = list[p6.selectedRow(inComponent: 0)]
        var 本pk1 = ""
        var 本pk2 = ""
        var 本pk3 = ""
        var 本pk4 = ""
        var 本pk5 = ""
        var 本pk6 = ""
        var 變pk1 = ""
        var 變pk2 = ""
        var 變pk3 = ""
        var 變pk4 = ""
        var 變pk5 = ""
        var 變pk6 = ""
        func mm0(s0:String, s1:inout String, s2:inout String){
            switch s0{
            case "-----":
                s1 = s0
                s2 = s0
            case "--  --":
                s1 = s0
                s2 = s0
            case "- x -":
                s1 = "--  --"
                s2 = "-----"
            case "- o -":
                s1 = "-----"
                s2 = "--  --"
            default:
                break
            }
        }
        func mm1(s0:[String])->String{
            var ss = ""
            if(s0 == ["-----","-----","-----"]){ss = "乾"}
            if(s0 == ["--  --","-----","-----"]){ss = "兌"}
            if(s0 == ["-----","--  --","-----"]){ss = "離"}
            if(s0 == ["--  --","--  --","-----"]){ss = "震"}
            if(s0 == ["-----","-----","--  --"]){ss = "巽"}
            if(s0 == ["--  --","-----","--  --"]){ss = "坎"}
            if(s0 == ["-----","--  --","--  --"]){ss = "艮"}
            if(s0 == ["--  --","--  --","--  --"]){ss = "坤"}
            return ss
        }
        mm0(s0: pk1, s1: &本pk1, s2: &變pk1)
        mm0(s0: pk2, s1: &本pk2, s2: &變pk2)
        mm0(s0: pk3, s1: &本pk3, s2: &變pk3)
        mm0(s0: pk4, s1: &本pk4, s2: &變pk4)
        mm0(s0: pk5, s1: &本pk5, s2: &變pk5)
        mm0(s0: pk6, s1: &本pk6, s2: &變pk6)
        let 手本 = mm1(s0: [本pk6,本pk5,本pk4]) + mm1(s0: [本pk3,本pk2,本pk1])
        let 手變 = mm1(s0: [變pk6,變pk5,變pk4]) + mm1(s0: [變pk3,變pk2,變pk1])
        aa[0] = egn01.index(of: 手本)!
        aa[1] = egn01.index(of: 手變)!
        return aa
    }

    @IBAction func 回首頁(_ sender: UIButton) {
        if let vc  = storyboard?.instantiateViewController(withIdentifier: "homeVc"){
            show(vc, sender: self)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("選了\(list[row])")
    }
//----------------------------------------------------------
    func 干支(年:String,月:String,日:String,時:String,分:String){
        let min:Double = Double(分)!/60.0
        let time:Double = Double(時)! + min
        if time<24 && time>23.25{ww = dd[0]}
        if time>0 && time<1.25{ww = dd[0]}
        if time>1.25 && time<3.25{ww = dd[1]}
        if time>3.25 && time<5.25{ww = dd[2]}
        if time>5.25 && time<7.25{ww = dd[3]}
        if time>7.25 && time<9.25{ww = dd[4]}
        if time>9.25 && time<11.25{ww = dd[5]}
        if time>11.25 && time<13.25{ww = dd[6]}
        if time>13.25 && time<15.25{ww = dd[7]}
        if time>15.25 && time<17.25{ww = dd[8]}
        if time>17.25 && time<19.25{ww = dd[9]}
        if time>19.25 && time<21.25{ww = dd[10]}
        if time>21.25 && time<23.25{ww = dd[11]}
        let ss:String = my.myTo(年: 年,月: 月,日: 日)
        let sql3:NSString = ("SELECT * FROM Tdym WHERE id<=" + ss + " ORDER BY id DESC LIMIT 1") as NSString
        statement = nil
        if delegate.db != nil{
            if sqlite3_prepare_v2(delegate.db, sql3.utf8String, -1, &statement, nil) != SQLITE_OK {
                alertOneBtn("讀取失敗", pMessage:"讀取資料庫失敗！", btnTitle:"確定")
                exit(1)
            }else{
                arTD.removeAll(keepingCapacity: true)
                if sqlite3_step(statement) == SQLITE_ROW {
                    addTD(arrTD: &arTD, statement: statement)
                    sqlite3_finalize(statement)
                }
                let td:Int = my.totan(Year: 年, Month: 月, Day: 日)-694801
                data2[0] = Int(arTD[0].id)
                data2[1] = Int(arTD[0].tdHour)
                bz[0] = ""
                bz[1] = arTD[0].tdYr //年干支
                bz[2] = arTD[0].tdMon //月干支
                bz[3] = tt[td%10]+dd[td%12] //日干支
                let index1 = bz[3].index(bz[3].startIndex,offsetBy:1)
                let s1:String = bz[3].substring(to: index1)//日干
                var s2:String = ""
                var i0:Int = 0
                var i1:Int = 0
                var num:Int = 0
                for i in 0..<10{
                    if tt[i] == s1{
                        s2 = tm0[i]
                    }
                }
                for j in 0..<10{
                    if tt[j] == s2{
                        i0 = Int(j)
                    }
                }
                for k in 0..<12{
                    if dd[k] == ww{
                        i1 = Int(k)
                    }
                }
                num = i0 + i1
                num = num>9 ? num-10 : num
                s2 = tt[num] + ww
                bz[4] = s2
            }//else
        }//delegate
        let yindex = bz[1].index(bz[1].startIndex,offsetBy:1)
        let ytg:String = bz[1].substring(to: yindex)//年天干
        tgDg[0] = ytg
        let ydg:String = bz[1].substring(from: yindex)//年地支
        tgDg[1] = ydg
        let mindex = bz[2].index(bz[2].startIndex,offsetBy:1)
        let mtg:String = bz[2].substring(to: mindex)//月天干
        tgDg[2] = mtg
        let mdg:String = bz[2].substring(from: mindex)//月地支
        tgDg[3] = mdg
        let dindex = bz[3].index(bz[3].startIndex,offsetBy:1)
        let dtg:String = bz[3].substring(to: dindex)//日天干
        tgDg[4] = dtg
        let ddg:String = bz[3].substring(from: dindex)//日地支
        tgDg[5] = ddg
        let tindex = bz[4].index(bz[4].startIndex,offsetBy:1)
        let ttg:String = bz[4].substring(to: tindex)//時天干
        tgDg[6] = ttg
        let tdg:String = bz[4].substring(from: tindex)//時地支
        tgDg[7] = tdg
    }
    func 農曆(年:String,月:String,日:String,時:String,分:String){
            let ss:String = my.myTo(年: 年,月: 月,日: 日)
            let sql:NSString = ("SELECT * FROM Sun WHERE id<=" + ss + " ORDER BY id DESC LIMIT 2") as NSString
            statement = nil
            if delegate.db != nil{
                if sqlite3_prepare_v2(delegate.db, sql.utf8String, -1, &statement, nil) != SQLITE_OK {
                    alertOneBtn("讀取失敗", pMessage:"讀取資料庫失敗！", btnTitle:"確定")
                    exit(1)
                }
                arSM.removeAll(keepingCapacity: true)
                while sqlite3_step(statement) == SQLITE_ROW {
                    addmoon(arrSM: &arSM, statement: statement)
                }
                sqlite3_finalize(statement) //關閉資料記錄
            }//delegate
            let i0:Int = my.totan(Year: 年, Month: 月, Day: 日) - my.totan(Year: String(arSM[0].sunYear), Month: String(arSM[0].sunMonth), Day: String(arSM[0].sunDay))
            let i1:Int = my.totan(Year: 年, Month: 月, Day: 日) - my.totan(Year: String(arSM[1].sunYear), Month: String(arSM[1].sunMonth), Day: String(arSM[1].sunDay))
            
            let n0 = Int(arSM[0].moonMonth)
            let n1 = Double(n0)
            農曆月 = arSM[0].moonMonth > n1 ? "閏" + String(n0) : String(n0)
            let xx = i0 + Int(arSM[0].moonDay)
            農曆日 = String(xx)
            農曆[0] = n0
            農曆[1] = arSM[0].moonMonth > n1 ? Int(arSM[1].moonDay) + i1 : Int(arSM[0].moonDay) + i0
    }
//-------------------------------------------------------------
    func addname(arrNM:inout Array<NM>, statement:OpaquePointer?) -> Void {
        let name = sqlite3_column_text(statement,0)
        let sn = String(cString: UnsafePointer<UInt8>(name!))
        let gender = sqlite3_column_text(statement,1)
        let sg = String(cString: UnsafePointer<UInt8>(gender!))
        let sy = sqlite3_column_int(statement,2)
        let smn = sqlite3_column_int(statement,3)
        let sd = sqlite3_column_int(statement,4)
        let sh = sqlite3_column_int(statement,5)
        let sm = sqlite3_column_int(statement,6)
        let snm:NM = NM(Name:sn, Gender:sg, Year:sy, Month:smn, Day:sd, Hour:sh, Minute:sm)
        arrNM.append(snm) //將資料列存入陣列
    }
    
    func addmoon(arrSM:inout Array<SM>, statement:OpaquePointer?) -> Void {
        let sid = sqlite3_column_int(statement,0)
        let sy = sqlite3_column_int(statement,1)
        let sm = sqlite3_column_int(statement,2)
        let sd = sqlite3_column_int(statement,3)
        let mm = sqlite3_column_double(statement,4)
        let md = sqlite3_column_int(statement,5)
        let smm:SM = SM(id:sid, sunYear:sy, sunMonth:sm, sunDay:sd, moonMonth:mm, moonDay:md)
        arrSM.append(smm) //將資料列存入陣列
    }
    
    func addTD(arrTD:inout Array<TD>, statement:OpaquePointer?) -> Void {
        let sid = sqlite3_column_int(statement,0)
        let sy = sqlite3_column_int(statement,1)
        let sm = sqlite3_column_int(statement,2)
        let sd = sqlite3_column_int(statement,3)
        let tty = sqlite3_column_text(statement,4)
        let ty = String(cString: UnsafePointer<UInt8>(tty!))
        let ttm = sqlite3_column_text(statement,5)
        let tm = String(cString: UnsafePointer<UInt8>(ttm!))
        let th = sqlite3_column_int(statement,6)
        let td:TD = TD(id:sid, sunYr:sy, sunMon:sm, sunDay:sd, tdYr:ty, tdMon:tm, tdHour:th)
        arrTD.append(td) //將資料列存入陣列
    }
//-------------------------------------------------------------
    func alertMsg(titleStr: String, msgStr: String) -> Void{
        let alertController = UIAlertController(title: titleStr, message: msgStr, preferredStyle: .alert)
        let sureAction = UIAlertAction(title: "確定", style: .default, handler: nil)
        alertController.addAction(sureAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertOneBtn(_ pTitle:String, pMessage:String, btnTitle:String) {
        let alertController = UIAlertController(title: pTitle, message: pMessage, preferredStyle: .alert)
        let sureAction = UIAlertAction(title: btnTitle, style: .default,handler:nil)
        alertController.addAction(sureAction)
        self.present(alertController, animated: true, completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
//------------------------------------------------------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        usdata[0] = ""
        usdata[1] = ""
        usdata[2] = 現年.text!
        usdata[3] = 現月.text!
        usdata[4] = 現日.text!
        usdata[5] = 現時.text!
        usdata[6] = 現分.text!
        thing = 事由.text!
        命卦n = 手卦()
        switch segue.identifier {
        case "手動顯卦"?:
            let comCon = segue.destination as! displayVc
            delegate.n命卦n = 3
            comCon.usdata = usdata
            comCon.data2 = data2
            comCon.tgDg = tgDg
            comCon.egn8 = egn8
            comCon.egn0 = egn0
            comCon.bz = bz
            comCon.tt = tt
            comCon.dd = dd
            comCon.命卦n = 命卦n
            comCon.農曆 = 農曆
            comCon.thing = thing
            // comCon.平閏月 = 平閏月
        //     comCon.舊曆日 = 舊曆日
        default:
            break
        }//switch
        
    }//prepare
    
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
