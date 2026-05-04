1.Созадл файл с конфигурацие сервиса в /etc/systemd/system/log-writer.service  
2.Заполнил его  
```
[Unit]
Description=Simple log writer script
[Service]  
Type=simple
ExecStart=/bin/bash /home/student/Study/DevOps/LINUX/l3/log_writer.sh
Restart=always    
RestartSec=5  
User=student 
Group=nogroup

NoNewPrivileges=yes
MemoryMax=100M
CPUQuota=50%

[Install]
WantedBy=multi-user.target

```
3. Включил сервис с помощью systemd start  
4. Включил автозапус с помощью systemd enable
