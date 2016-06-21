%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\installutil.exe C:\Users\gm\Desktop\i4bus12.27\qdRealBusSVN\qdRealBusService\bin\Debug\qdRealBusService.exe
Net Start qdRealBusService
sc config qdRealBusService start= auto
pause