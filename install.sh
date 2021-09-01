# resource: https://gist.github.com/starlinq/637ea838c161281b522e66d5c5a71f5c

# качаем последнюю версию архива отсюда: https://github.com/yar229/WebDavMailRuCloud/releases/
# распаковываем
# переносим в /opt

#sudo apt-get install -y apt-transport-https (если не установлен)

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install -y dotnet-runtime-3.1

# dotnet --info инфа

sudo apt update && sudo apt install mono-complete -y

# переносим все в /opt

# запуск: mono /opt/<путь>/wdmrc.exe -p 8888

# создаем systemd-unit:

nano /etc/systemd/system/cloud-mail.service

# unit

[Unit]
Description=WedDAV Mail.ru wrapper service
After=network.target

[Service]
ExecStart=mono /opt/cloud_mail/webdav1/wdmrc.exe -p 8888 --maxthreads 8

[Install]
WantedBy=default.target

# запуск и автозагрузка
sudo systemctl start cloud-mail && sudo systemctl enable cloud-mail


# подключиться:

dav://127.0.0.1:8888/
