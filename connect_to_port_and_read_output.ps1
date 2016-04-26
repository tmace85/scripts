param( 
    [string] $remoteHost = "localhost", 
    [int] $port = 10000
     ) 
 
try
{
    ## Open the socket, and connect to the computer on the specified port 
    write-host "Connecting to $remoteHost on port $port"
    $socket = new-object System.Net.Sockets.TcpClient($remoteHost, $port) 
    if($socket -eq $null) { return; } 
 
    $stream = $socket.GetStream() 
    $writer = new-object System.IO.StreamWriter($stream) 
 
    $buffer = new-object System.Byte[] 1024 
    $encoding = new-object System.Text.AsciiEncoding 
 
   
          $read = $stream.Read($buffer, 0, 1024)    
          $Output= $encoding.GetString($buffer, 0, $read)
          $Output
         #write-host -n ($encoding.GetString($buffer, 0, $read))
          $stream.close()  
          $writer.close()
         
}
finally
{
    ## Close the streams 
    $writer.Close() 
    $stream.Close()
}

