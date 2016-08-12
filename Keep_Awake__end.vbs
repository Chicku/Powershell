' Keep_Awake__end.vbs
' --- Define Object
    Set wmi = GetObject("winmgmts://./root/cimv2")

' --- Search and Destroy
    qry = "SELECT * FROM Win32_Process WHERE Name='wscript.exe' AND NOT " & _
    "CommandLine LIKE '%" & Replace(WScript.ScriptFullName, "\", "\\") & "%'"

    For Each p In wmi.ExecQuery(qry)
      p.Terminate
    Next

' --- Clean up
    Set wmi = Nothing ' Release the Application object