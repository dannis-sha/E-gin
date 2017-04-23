//
//  ViewController.swift
//  E-gin
//
//  Created by Mac on 2017/3/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class homeVc: UIViewController,UITableViewDataSource, UITableViewDelegate {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    var bz = ["","","","","",""]
    var usdata = ["","","","","","",""]
    var data2 = [0,0]
    var ww:String = ""
    var currentIdex:Int = 0
    var sqlmy:NSString = ""
    let tt = ["甲","乙","丙","丁","戊","己","庚","辛","壬","癸"]
    let dd = ["子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥"]
    let egn8 = ["乾","兌","離","震","巽","坎","艮","坤"]
    let tm0 = ["甲","丙","戊","庚","壬","甲","丙","戊","庚","壬"]
    var tgDg = ["","","","","","","",""]//四柱的八個天干地支
    let egn0 = ["乾為天","天風姤","天山遯","天地否","風地觀","山地剝","火地晉","火天大有","兌為澤","澤水困","澤地萃","澤山咸","水山蹇","地山謙","雷山小過","雷澤歸妹","離為火","火山旅","火風鼎","火水未濟","山水蒙","風水渙","天水訟","天火同人","震為雷","雷地豫","雷水解","雷風恆","地風升","水風井","澤風大過","澤雷隨","巽為風","風天小畜","風火家人","風雷益","天雷無妄","火雷嗜嗑","山雷頤","山風蠱","坎為水","水澤節","水雷屯","水火既濟","澤火革","雷火豐","地火明夷","地水師","艮為山","山火賁","山天大畜","山澤損","火澤睽","天澤履","風澤中孚","風山漸","坤為地","地雷復","地澤臨","地天泰","雷天大壯","澤天夬","水天需","水地比"]
    let egn01 = ["乾乾","乾巽","乾艮","乾坤","巽坤","艮坤","離坤","離乾","兌兌","兌坎","兌地","兌艮","坎艮","坤艮","震艮","震兌","離離","離艮","離巽","離坎","艮坎","巽坎","乾坎","乾離","震震","震坤","震坎","震巽","坤巽","坎巽","兌巽","兌震","巽巽","巽乾","巽離","巽震","乾震","離震","艮震","艮巽","坎坎","坎兌","坎震","坎離","兌離","震離","坤離","坤坎","艮艮","艮離","艮乾","艮兌","離兌","乾兌","巽兌","巽艮","坤坤","坤震","坤兌","坤乾","震乾","兌乾","坎乾","坎坤"]
    let 命變卦0 = [["巽","離","兌"],["坎","震","乾"],["艮","乾","震"],["坤","兌","離"],["乾","艮","坎"],["兌","坤","巽"],["離","巽","坤"],["震","坎","艮"]]
    var 農曆 = [0,0]
    var 年干支 = ""
    var 月干支 = ""
    var 日干支 = ""
    var 時干支 = ""
    var 命卦n = [0,0]
//    var 平閏月 = ""
//    var 舊曆日 = ""
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
    
    //    var db:OpaquePointer? = nil; //資料庫
    var statement:OpaquePointer? = nil //資料記錄
    var arNM:Array<NM> = [] //存資料的陣列
    var arSM:Array<SM> = [] //存資料的陣列
    var arTD:Array<TD> = []
    
    @IBOutlet weak var TBS: UITableView!
    @IBOutlet weak var 姓名: UITextField!
    @IBOutlet weak var 性別: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var day: UITextField!
    @IBOutlet weak var hour: UITextField!
    @IBOutlet weak var minute: UITextField!
    @IBOutlet weak var 農曆月: UILabel!
    @IBOutlet weak var 農曆日: UILabel!
    @IBOutlet weak var yinyang: UILabel!
    @IBOutlet weak var 現年: UILabel!
    @IBOutlet weak var 現月: UILabel!
    @IBOutlet weak var 現日: UILabel!
    @IBOutlet weak var 現時: UILabel!
    @IBOutlet weak var 現分: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    let fo = DateFormatter.self
        //    fo.dateFormat = "yyyy/M/d H:m:s"
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
        
        let sql1:NSString = "SELECT * FROM User ORDER BY Name ASC" as NSString
        statement = nil
        if delegate.db != nil {
            if sqlite3_prepare_v2(delegate.db, sql1.utf8String, -1, &statement, nil) != SQLITE_OK {
                alertOneBtn("讀取失敗", pMessage:"讀取資料庫失敗！", btnTitle:"確定")
                exit(1)
            }else{
                arNM.removeAll(keepingCapacity: true)
                while sqlite3_step(statement) == SQLITE_ROW {
                    addname(arrNM: &arNM, statement: statement)
                }
                sqlite3_finalize(statement)
                TBS.reloadData()
             //   showSingle(n: 0)
            }//else
        }//delegate
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//----------------------------------------------------------
    
    @IBAction func 查詢(_ sender: UIButton) {
        if 姓名.text! == "匿名" {
            alertOneBtn("查詢資料庫", pMessage:"需要輸入姓名?", btnTitle:"確定")
        } else {
            bz[0] = 姓名.text!
            usdata[0] = 姓名.text!
            let sql1:NSString = "SELECT * FROM User WHERE Name ='"+usdata[0]+"'" as NSString
            statement = nil
            if delegate.db != nil{
                if sqlite3_prepare_v2(delegate.db, sql1.utf8String, -1, &statement, nil) != SQLITE_OK {
                    alertOneBtn("讀取失敗", pMessage:"讀取資料庫失敗！", btnTitle:"確定")
                    exit(1)
                }else{
                    arNM.removeAll(keepingCapacity: true)
                    if sqlite3_step(statement) != 100 {
                        alertOneBtn("沒有此人資料", pMessage:"請登記資料！", btnTitle:"確定")
                        sqlite3_finalize(statement) //關閉資料記錄
                    }else{
                        addname(arrNM: &arNM, statement: statement)
                        sqlite3_finalize(statement)
                        性別.text = arNM[0].Gender
                        year.text = String(arNM[0].Year)
                        month.text = String(arNM[0].Month)
                        day.text = String(arNM[0].Day)
                        hour.text = String(arNM[0].Hour)
                        minute.text = String(arNM[0].Minute)
                        usdata[0] = 姓名.text!
                        usdata[1] = 性別.text!
                        usdata[2] = year.text!
                        usdata[3] = month.text!
                        usdata[4] = day.text!
                        usdata[5] = hour.text!
                        usdata[6] = minute.text!
                        農曆(年: year.text!, 月: month.text!, 日: day.text!, 時: hour.text!, 分: minute.text!)
                        干支(年: year.text!, 月: month.text!, 日: day.text!, 時: hour.text!, 分: minute.text!)
                    }//else 3
                }//else 2
            }//else 1
        }//delegate
        年干支 = bz[1]
        月干支 = bz[2]
        日干支 = bz[3]
        時干支 = bz[4]
    }//查詢
    @IBAction func 刪除(_ sender: UIButton) {
        if arNM.count > 1 {
            alerView(buttonTitle: "刪除", msgStr: "確定要刪除資料嗎?")
        }else{
            self.alertMsg(titleStr: "失敗", msgStr: "只有一筆資料時不可以刪除!")
        }
    }
    
    @IBAction func 新增(_ sender: UIButton) {
        //        buttonToggle(清空值: true, 新增值: false)
        sqlmy = "INSERT INTO User (Name, Gender, Year, Month, Day, Hour, Minute) VALUES ('\(姓名.text!)','\(性別.text!)',\(year.text!),\(month.text!),\(day.text!),\(hour.text!),\(minute.text!))" as NSString
        statement = nil
        if delegate.db != nil{
            sqlite3_prepare_v2(delegate.db, sqlmy.utf8String, -1, &statement, nil)
            if sqlite3_step(statement) == SQLITE_DONE {
                alertMsg(titleStr: "成功", msgStr: "資料庫新增成功!")
            }else{
                alertMsg(titleStr: "失敗", msgStr: "資料庫新增失敗!")
            }
        }//delegate
        let name = 姓名.text!
        let gender = 性別.text!
        let yr = Int32(Int(year.text!)!)
        let mn = Int32(Int(month.text!)!)
        let dy = Int32(Int(day.text!)!)
        let hr = Int32(Int(hour.text!)!)
        let mt = Int32(Int(minute.text!)!)
        let mynm:NM = NM(Name: name, Gender: gender, Year: yr, Month: mn, Day: dy, Hour: hr, Minute: mt)
        arNM.append(mynm)
        TBS.reloadData()
        showSingle(n: arNM.count - 1)
        currentIdex = arNM.count - 1
    }
//--------------------------------------------------------------
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
                bz[0] = 姓名.text!
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
        switch ytg {
        case "甲","丙","戊","庚","壬":
            bz[5] = "陽" + 性別.text!
        default:
            bz[5] = "陰" + 性別.text!
        }//陽男陰女
        yinyang.text = bz[5]
        年干支 = bz[1]
        月干支 = bz[2]
        日干支 = bz[3]
        時干支 = bz[4]
    }
    
    func 農曆(年:String,月:String,日:String,時:String,分:String){
        if 年 == "" || 月 == "" || 日 == "" || 時 == "" || 分 == ""{
            alertOneBtn("範圍確認", pMessage:"需要輸入文字?", btnTitle:"確定")
        } else {
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
            農曆月.text = arSM[0].moonMonth > n1 ? "閏" + String(n0) : String(n0)
            農曆日.text = String(i0 + Int(arSM[0].moonDay))
            農曆[0] = n0
            農曆[1] = arSM[0].moonMonth > n1 ? Int(arSM[1].moonDay) + i1 : Int(arSM[0].moonDay) + i0
        }//else
    }
    func myfunc2() -> [Int]{//命卦會用到
        let 本命卦上 = egn8[(農曆[1]-1)%8]
        let 本命卦下 = egn8[(農曆[0]-1)%8]
        var 命上卦 = ""
        var 命下卦 = ""
        var 變命卦上 = ""
        var 變命卦下 = ""
        var aa = [Int]()
        命上卦 = egn8[(農曆[1]-1)%8]
        命下卦 = egn8[(農曆[0]-1)%8]
        let sstr = 命上卦 + 命下卦
        let 本命卦n = Int(egn01.index(of: sstr)!)
        switch tgDg[7]{
        case "子","午":
            變命卦上 = 本命卦上
            變命卦下 = 命變卦0[Int(egn8.index(of: 本命卦下)!)][0]
        case "丑","未":
            變命卦上 = 本命卦上
            變命卦下 = 命變卦0[Int(egn8.index(of: 本命卦下)!)][1]
        case "寅","申":
            變命卦上 = 本命卦上
            變命卦下 = 命變卦0[Int(egn8.index(of: 本命卦下)!)][2]
        case "卯","酉":
            變命卦上 = 命變卦0[Int(egn8.index(of: 本命卦上)!)][0]
            變命卦下 = 本命卦下
        case "辰","戌":
            變命卦上 = 命變卦0[Int(egn8.index(of: 本命卦上)!)][1]
            變命卦下 = 本命卦下
        case "巳","亥":
            變命卦上 = 命變卦0[Int(egn8.index(of: 本命卦上)!)][2]
            變命卦下 = 本命卦下
        default:
            break
        }
        let 命變卦1 = 變命卦上 + 變命卦下
        let 命變卦n = Int(egn01.index(of: 命變卦1)!)
//        let 命變卦 = String(命變卦n)
        aa.append(本命卦n)
        aa.append(命變卦n)
    return aa
//        排卦(數字1: 本命卦n, 數字2: 命變卦n)
    }
    
//-----------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arNM.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIdex = indexPath.row
        showSingle(n: currentIdex)
//        命卦n =  myfunc2()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = "\(arNM[indexPath.row].Name) \(arNM[indexPath.row].Gender)"
        cell.detailTextLabel?.text = "\(arNM[indexPath.row].Year)年\(arNM[indexPath.row].Month)月\(arNM[indexPath.row].Day)日"
        return cell
    }

    func showSingle(n:Int){
        姓名.text = arNM[n].Name
        性別.text = arNM[n].Gender
        year.text = "\(arNM[n].Year)"
        month.text = "\(arNM[n].Month)"
        day.text = "\(arNM[n].Day)"
        hour.text = "\(arNM[n].Hour)"
        minute.text = "\(arNM[n].Minute)"
        農曆(年: year.text!, 月: month.text!, 日: day.text!, 時: hour.text!, 分: minute.text!)
        干支(年: year.text!, 月: month.text!, 日: day.text!, 時: hour.text!, 分: minute.text!)
        年干支 = bz[1]
        月干支 = bz[2]
        日干支 = bz[3]
        時干支 = bz[4]
        命卦n =  myfunc2()
    }
//-----------------------------------------------------------
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
//----------------------------------------------------------
    func alerView(buttonTitle: String, msgStr: String){
        let alertController = UIAlertController(title: buttonTitle, message: msgStr, preferredStyle: .alert)
        switch buttonTitle{
        case "刪除":
            let sureAction = UIAlertAction(title: buttonTitle, style: .default, handler: { ACTION -> Void in
                self.sqlmy = "DELETE FROM User WHERE Name='" + self.姓名.text! + "'" as NSString
                self.statement = nil
                if self.delegate.db != nil{
                    sqlite3_prepare_v2(self.delegate.db, self.sqlmy.utf8String, -1, &self.statement, nil)
                    if sqlite3_step(self.statement) == SQLITE_DONE{
                        self.alertMsg(titleStr: "成功", msgStr: "資料庫刪除成功!")
                    }else{
                        self.alertMsg(titleStr: "失敗", msgStr: "資料庫刪除失敗!")
                    }
                }//delegate
                self.arNM.remove(at: self.currentIdex)
                self.TBS.reloadData()
                self.showSingle(n: self.arNM.count - 1)
                if self.currentIdex == self.arNM.count{
                    self.currentIdex = self.currentIdex - 1
                }
                self.showSingle(n: self.currentIdex)
            })
            alertController.addAction(sureAction)
            let cancelAction = UIAlertAction(title: "取消", style: .default, handler: nil)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        default:
            break
        }
        
    }
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
    func removeKeyboard(){
        姓名.resignFirstResponder()
        性別.resignFirstResponder()
        year.resignFirstResponder()
        month.resignFirstResponder()
        day.resignFirstResponder()
        hour.resignFirstResponder()
        minute.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func 手動起卦(_ sender: UIButton) {
        if let vc  = storyboard?.instantiateViewController(withIdentifier: "handVc"){
            show(vc, sender: self)
        }
    }
//-----------------------------------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        usdata[0] = 姓名.text!
        usdata[1] = 性別.text!
        usdata[2] = year.text != "" ? year.text! : 現年.text!
        usdata[3] = month.text != "" ? month.text! : 現月.text!
        usdata[4] = day.text != "" ? day.text! : 現日.text!
        usdata[5] = hour.text != "" ? hour.text! : 現時.text!
        usdata[6] = minute.text != "" ? minute.text! : 現分.text!

        干支(年: usdata[2], 月: usdata[3], 日: usdata[4], 時: usdata[5], 分: usdata[6])

        switch segue.identifier {
        case "命卦"?:
            let minCon = segue.destination as! displayVc
            delegate.n命卦n = 1
            minCon.usdata = usdata
            minCon.data2 = data2
            minCon.tgDg = tgDg
            minCon.egn8 = egn8
            minCon.egn0 = egn0
            minCon.bz = bz
            minCon.tt = tt
            minCon.dd = dd
            minCon.命卦n = 命卦n
//          minCon.yinyang5 = yinyang5
        case "電腦起卦"?:
            let comCon = segue.destination as! displayVc
            命卦n[0] = Int(arc4random_uniform(64))
            命卦n[1] = Int(arc4random_uniform(64))
            delegate.n命卦n = 2
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
//            comCon.平閏月 = 平閏月
//            comCon.舊曆日 = 舊曆日
        default:
            break
        }//switch
        
    }//prepare

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

