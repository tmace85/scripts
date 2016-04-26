param( 
    [string] $remoteHost = "localhost", 
    [int] $port = 10000
     ) 
 
try
{
    $socket = new-object System.Net.Sockets.TcpClient($remoteHost, $port) 
    if ($socket){
    $stream = $socket.GetStream() 
    $writer = new-object System.IO.StreamWriter($stream) 
 
    $buffer = new-object System.Byte[] 1024 
    $encoding = new-object System.Text.AsciiEncoding 
 
   
          $read = $stream.Read($buffer, 0, 1024)    
          $Output= $encoding.GetString($buffer, 0, $read)
         #write-host -n ($encoding.GetString($buffer, 0, $read))
          if ($stream)
          {
          $stream.close()  
          $writer.close()
          $socket.Close()
         }
        }
         
}
catch{
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName
    break
}
finally
{

 if ($ErrorMessage) {
 Write-Output "Warning - $ErrorMessage " 
 exit 1
 }
 else{
 
if ($Output -like "OUTPUT*" ) {
    write-output "Warning - "
    exit 1
}
else{
    
    write-output "OK"
    exit 0
    
} 
    }
}
   


# SIG # Begin signature block
# MIIEXwYJKoZIhvcNAQcCoIIEUDCCBEwCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUUD9YaR8QzpRCVvD6mhFz8nat
# h12gggJiMIICXjCCAcugAwIBAgIQmaopMOe7jbdFfdRIHwasozAJBgUrDgMCHQUA
# MDMxMTAvBgNVBAMTKFNZUzExIFVzZWQgZm9yIFBvd2Vyc2hlbGwgc2lnbmVkIFNj
# cmlwdHMwHhcNMTMwOTA2MDkxNjUxWhcNMzkxMjMxMjM1OTU5WjAxMS8wLQYDVQQD
# EyZTeXMxMSBQb3dlclNoZWxsIFVzZXIgY29kZXNpZ25pbmcgY2VydDCBnzANBgkq
# hkiG9w0BAQEFAAOBjQAwgYkCgYEAnoMtVIRdckvL+gf/UL6m6AiM+oVU+kXzy4pM
# Uwtv4o+12PLpCgnT9upFWsqDFt62N64fkkfuXy2M601lA9KiAp8ybIPslutnZIn3
# lL8/S3D4jmVXEKilHyn0Z4XPR11aWhHmrYmn54UmRkgPT0yTRIFBLplimVXoje2S
# 3RbRe90CAwEAAaN9MHswEwYDVR0lBAwwCgYIKwYBBQUHAwMwZAYDVR0BBF0wW4AQ
# r4nl6gWKuVfxQ3qeadaRE6E1MDMxMTAvBgNVBAMTKFNZUzExIFVzZWQgZm9yIFBv
# d2Vyc2hlbGwgc2lnbmVkIFNjcmlwdHOCECIJjp7XOleqTSEnO955FwwwCQYFKw4D
# Ah0FAAOBgQBqqLfSQ+M4CLKySwCjZCJ3nCGt0sYZqp6RRJe9cMW7tvo1eF+TCI2M
# ZoJ3/k+fz3nYFbTvVDOY8HRwzt+hO+FyszgVv3VvUo1etqXpwvJc6WAGlV6A+3sO
# mF6uOlDKWznt4h3nfgDgOmtNyrcT/Ob9xQJsteAe4ekUJIo04WoODTGCAWcwggFj
# AgEBMEcwMzExMC8GA1UEAxMoU1lTMTEgVXNlZCBmb3IgUG93ZXJzaGVsbCBzaWdu
# ZWQgU2NyaXB0cwIQmaopMOe7jbdFfdRIHwasozAJBgUrDgMCGgUAoHgwGAYKKwYB
# BAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAc
# BgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUaRjJ
# DTb6eEDcXxorWo0Ex0CEHggwDQYJKoZIhvcNAQEBBQAEgYBfG+2CWq6oT7REBBTc
# 1toX3ABTyjjzVFOmJY5P8g6IoXStkPINh7MZJMcOZdO7PkYVrV3ToLDnlL6eAURJ
# HxR2msW+3WlaU7RzaSuIjJEKgTw5OnWC6ceZvuxMxcacaBk49Q98+DRXBQejiCHJ
# 72EHDRbd140r8Qhpagvwwm7z7w==
# SIG # End signature block
