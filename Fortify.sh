var=`curl -X POST --header "Content-Type: application/json" --header "Accept: application/json" -d "{ 'settingsName': 'Default', 'overrides': {'scanName': 'JFrog-scan5','startUrls': ['https://repo.test.cloud.thdm.local'], 'crawlAuditMode':'CrawlAndAudit','startOption': 'url','dontStartScan': false,'scanScope': 'unrestricted'} }" http://10.210.54.246:8083/webinspect/scanner/scans`

echo $var
echo "ScanID $var"
result=${var:11:36}
echo $result

curl http://10.210.54.246:8083/webinspect/scanner/scans/$result?action=WaitForStatusChange
cd /godata/fortify-reports
curl -O http://10.210.54.246:8083/webinspect/scanner/scans/$result.fpr
curl -O http://10.210.54.246:8083/webinspect/scanner/scans/$result.scan
curl -O http://10.210.54.246:8083/webinspect/scanner/scans/$result.xml?detailType=Vulnerability
