import Foundation

class my{
    
static func totan(Year:String, Month:String, Day:String)->Int{
        //1903/04/06 694801甲子
        let i0:Int = Int(Year)!
        let i01:Int = i0-1
        let i1:Int = Int(Month)!-1
        let i2:Int = Int(Day)!
        let i3:Int = i01*365+i01/4
        let i4:Int = i0%4
        var tday:Int = 0
        let mon1:Array = [31,28,31,30,31,30,31,31,30,31,30,31]
        let mon2:Array = [31,29,31,30,31,30,31,31,30,31,30,31]
        for i in 0..<i1{
            if i4 != 0{tday = tday+mon1[i]}else{tday = tday+mon2[i]}
        }
        tday = tday+i2+i3
        return tday
    }
    
static  func myTo(年:String,月:String,日:String)->String {
        var s1:String = ""
        var s2:String = ""
        if 月.characters.count == 1{
            s1 = "0"+月
        }else{s1 = 月}
        if 日.characters.count == 1{
            s2 = "0"+日
        }else{s2 = 日}
        let s3:String =  String(Int32(年)!-1911)  + s1 + s2
        return s3
    }
static  func artsha(旬空:[[String]], 年干:Int, 年干支:String)->Int{
        let sg:[[String]] = 旬空
        let yg:Int = 年干
        let ytd:String = 年干支
        var ij = 0
        var jj = -1
        for _ in 0..<sg.count{
            if sg[ij][yg] == ytd{
                jj = ij
            }
            ij = ij + 1
        }
        return jj
    }
}//class
