; BIND data file for example.com 
;
$TTL  3600
@  IN SOA         ns1.example.com. hostmaster.example.com. (
      2020060301     ; Serial
            3600     ; Refresh (1 h)
            1800     ; Retry (30 m)
            604800   ; Expire (1 w)
            7200 )   ; Negative Cache TTL (2 h)

example.com.      IN    NS    ns1
                  IN    NS    ns2


example.com.      IN    A     192.168.0.10

ns1               IN    A     192.168.4.1
ns2               IN    A     192.168.4.2

