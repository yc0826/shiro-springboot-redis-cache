function getBasePath() {
    var obj = window.location;
    var contextPath = obj.pathname.split("/")[1];
    return obj.protocol + "//" + obj.host + "/" + contextPath;
}

function longToDateTime(longTypeDate) {
    var datetimeType = "";
    var date = new Date();
    date.setTime(longTypeDate);
    datetimeType = date.getFullYear() + "-" + getMonth(date) + "-" + getDay(date) + "&nbsp;" + getHours(date) + ":" + getMinutes(date) + ":" + getSeconds(date);//yyyy-MM-dd 00:00:00格式日期
    return datetimeType;
}

//返回 01-12 的月份值
function getMonth(date) {
    var month = "";
    month = date.getMonth() + 1; //getMonth()得到的月份是0-11
    if (month < 10) {
        month = "0" + month;
    }
    return month;
}

//返回01-30的日期
function getDay(date) {
    var day = "";
    day = date.getDate();
    if (day < 10) {
        day = "0" + day;
    }
    return day;
}

//返回小时
function getHours(date) {
    var hours = "";
    hours = date.getHours();
    if (hours < 10) {
        hours = "0" + hours;
    }
    return hours;
}

//返回分
function getMinutes(date) {
    var minute = "";
    minute = date.getMinutes();
    if (minute < 10) {
        minute = "0" + minute;
    }
    return minute;
}

//返回秒
function getSeconds(date) {
    var second = "";
    second = date.getSeconds();
    if (second < 10) {
        second = "0" + second;
    }
    return second;
}

function getToday() {
    var date = new Date();
    return date.getFullYear() + "-" + getMonth(date) + "-" + getDay(date)
}

function getCurrentMonthFirst(){
    var date=new Date();
    date.setDate(1);
    return date.getFullYear() + "-" + getMonth(date) + "-" + getDay(date);
}

function setReturnValueFalse(event) {
    if (event.preventDefault) {
        event.preventDefault();
    } else {
        event.returnValue = false;
    }
}



layui.config({
    base: getBasePath() + '/static/layui/custommodules/' //假设这是你存放拓展模块的根目录
});


var Calculator = function () {
    /***************************************************************************
     * 计算生肖
     *
     * 支持简写生日，比如01，转换为2001，89转换为1989； 支持任何可以进行时间转换的格式，比如'1989/01/01','1989 01'等
     *
     */
    function getShengXiao(birth) {
        birth += '';
        var len = birth.length;
        if (len < 4 && len !== 2) {
            return "";
        }
        if (len === 2) {
            birth - 0 > 30 ? birth = '19' + birth : birth = '20' + birth;
        }
        var year = (new Date(birth)).getFullYear();
        var arr = ['猴', '鸡', '狗', '猪', '鼠', '牛', '虎', '兔', '龙', '蛇', '马', '羊'];
        return /^\d{4}$/.test(year) ? arr[year % 12] : "";
    }

    /***************************************************************************
     * 计算星座
     *
     *
     */
    function getAstro(y, m, d) {
        var constellations = [{
            "Start": 121,
            "End": 220,
            "Name": "水瓶座"
        }, {
            "Start": 221,
            "End": 320,
            "Name": "双鱼座"
        }, {
            "Start": 321,
            "End": 420,
            "Name": "白羊座"
        }, {
            "Start": 421,
            "End": 520,
            "Name": "金牛座"
        }, {
            "Start": 521,
            "End": 620,
            "Name": "双子座"
        }, {
            "Start": 621,
            "End": 720,
            "Name": "巨蟹座"
        }, {
            "Start": 721,
            "End": 820,
            "Name": "狮子座"
        }, {
            "Start": 821,
            "End": 920,
            "Name": "处女座"
        }, {
            "Start": 921,
            "End": 1020,
            "Name": "天秤座"
        }, {
            "Start": 1021,
            "End": 1120,
            "Name": "天蝎座"
        }, {
            "Start": 1121,
            "End": 1220,
            "Name": "射手座"
        }];
        /*
         * 判断日期有效性 1,3,5,7,8,10,12为31天 2月润年29，非润年28 4,6,9,11为30天
         */
        var daysInMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

        // 检测年份
        if (y < 1970 || y > 2099)
            return "";

        // 检测月份
        if (m < 1 || m > 12)
            return "";

        // 检测日期
        var mDays = daysInMonth[m - 1];
        // 如果是二月，要根据年份计算天数，不是二月时略过此计算
        if (m == 2) {
            mDays = GetSpecialDays(y)
        }

        // 判断日数据是不是在月份的有效天范围
        if (d < 0 || d > mDays)
            return "";

        // 好了，走到这一步，说明上面的验证都TM过了。
        // 这才判断是哪一个星座
        // 星座座标等于m*100 + d
        var pos = parseInt(m * 100) + parseInt(d);
        for (var i in constellations) {
            if (pos >= constellations[i].Start && pos <= constellations[i].End) {
                return constellations[i].Name;
            }
        }
        return "摩羯座";
    }

    // 根据年份计算二月天数
    function GetSpecialDays(y) {
        if (y % 400 == 0 || (y % 4 == 0 && y % 100 != 0))
            return 29;
        return 28;
    }

    /***************************************************************************
     * 计算年龄
     *
     * 支持传递["yyyy-MM-dd"]等格式的字符串
     *
     */
    function getAge(str) {
        var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
        if (r == null)
            return false;
        var d = new Date(r[1], r[3] - 1, r[4]);
        if (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3]
            && d.getDate() == r[4]) {
            var Y = new Date().getFullYear();
            return (Y - r[1]);
        }
        return "";
    }

    return {
        shengxiao: getShengXiao,
        astro: getAstro,
        age: getAge
    }
}();
function checkIdcard(idcard) {
    var Errors = ["验证通过!",
        "身份证号码位数不对!",
        "身份证号码出生日期超出范围或含有非法字符!",
        "身份证号码校验错误!",
        "身份证地区非法!"];
    var area = {
        11: "北京",
        12: "天津",
        13: "河北",
        14: "山西",
        15: "内蒙古",
        21: "辽宁",
        22: "吉林",
        23: "黑龙江",
        31: "上海",
        32: "江苏",
        33: "浙江",
        34: "安徽",
        35: "福建",
        36: "江西",
        37: "山东",
        41: "河南",
        42: "湖北",
        43: "湖南",
        44: "广东",
        45: "广西",
        46: "海南",
        50: "重庆",
        51: "四川",
        52: "贵州",
        53: "云南",
        54: "西藏",
        61: "陕西",
        62: "甘肃",
        63: "青海",
        64: "宁夏",
        65: "新疆",
        71: "台湾",
        81: "香港",
        82: "澳门",
        91: "国外"
    };

    var Y, JYM;
    var S, M;
    var idcard_array = idcard.split("");

    //地区检验
    if (area[parseInt(idcard.substr(0, 2))] == null)
        return Errors[4];
    var ereg;
    //身份号码位数及格式检验
    switch (idcard.length) {
        case 15:
            if ((parseInt(idcard.substr(6, 2)) + 1900) % 4 === 0 || ((parseInt(idcard.substr(6, 2)) + 1900) % 100 === 0 && (parseInt(idcard.substr(6, 2)) + 1900) % 4 === 0)) {
                ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性
            } else {
                ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性
            }

            if (ereg.test(idcard)) return Errors[0];
            else
                return Errors[2];
            break;
        case 18:
            //18位身份号码检测
            //出生日期的合法性检查
            //闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
            //平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
            if (parseInt(idcard.substr(6, 4)) % 4 === 0 || (parseInt(idcard.substr(6, 4)) % 100 === 0 && parseInt(idcard.substr(6, 4)) % 4 === 0)) {
                ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式
            } else {
                ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式
            }
            if (ereg.test(idcard)) {//测试出生日期的合法性
                //计算校验位
                S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
                    + (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
                    + (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
                    + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
                    + (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
                    + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
                    + (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
                    + parseInt(idcard_array[7])
                    + parseInt(idcard_array[8]) * 6
                    + parseInt(idcard_array[9]) * 3;
                Y = S % 11;
                M = "F";
                JYM = "10X98765432";
                M = JYM.substr(Y, 1);//判断校验位
                if (M === idcard_array[17]) return Errors[0]; //检测ID的校验位
                else return Errors[3];
            }
            else return Errors[2];
            break;
        default:
            return Errors[1];
    }
}
