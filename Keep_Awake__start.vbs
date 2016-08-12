' Keep_Awake__start.vbs

' --- Define Object
    set wsc = CreateObject("WScript.Shell")

' --- Loop every so many minutes and change the scroll lock setting 
    Do
        ' Wait for ~2 minutes
        WScript.Sleep (2*60*1000)
        wsc.SendKeys ("{SCROLLLOCK 2}")
    Loop