---
layout: page
title:  Устанавливаем youtrack 5.x в бесплатном облаке openshift.
permalink: /tips/how-to-install-youtrack
---


**Запуск youtrack будем производить в Standalone (используя встроенный jetty) режиме.**

#### Требования youtrack:
 * To run YouTrack Standalone via JAR distribution file, you need to have
Java JDK 1.5 and higher.*
* YouTrack requires at least 512Mb of JVM heap memory. You can set the
size of heap memory via -Xmx parameter when starting youtrack-xx.jar
from the command line.  
Otherwise, set the system default JVM heap size. As the YouTrack
database grows you should increase the JVM memory size.  
In order to open graphic attachments and render image thumbnails
correctly, it is required to use Java in Headless Mode. To enable Java
Headless Mode, you can use -Djava.awt.headless=true parameter in the
command line, when starting YouTrack, or set java.awt.headless system
property. For more information about Java Headless Mode please refer to
the[Using Headless Mode in the Java SE
Platform](http://java.sun.com/developer/technicalArticles/J2SE/Desktop/headless/)
article on Java official web-site.*

#### Ограничения виртуальной среды openshift:

* Доступ к файлам и папкам.
* Для записи и хранения пользовательских данных предусмотена папка
* app-root/data. Путь береться из переменной OPENSHIFT\_DATA\_DIR.
* Доступ к сети.
* Доступный ip адрес и порт содержится в переменных :
    * OPENSHIFT\_DIY\_IP
    * OPENSHIFT\_DIY\_PORT
    
Youtrack создает в домашней каталоге пользователя свои директории для БД
и для backup БД. При запуске Jetty создает свои файлы и папки в домашнем
каталоге пользователя. Для jetty так же необходимо указать порт и адрес
который будет прослушиваться для входящих подключений.
  
#### Переменные среды которые нам понадобятся:

``OPENSHIFT\_DATA\_DIR`` - данные нашел приложения, на нее есть права на запись, и она не перезаписіваеться при редеплое.  
``OPENSHIFT\_REPO\_DIR`` - папка с репозиторием приложения.

``OPENSHIFT\_DIY\_IP`` - ip адрес виртуальной машины.
``OPENSHIFT\_DIY\_PORT`` - порт адрес виртуальной машины.


#### Исходя из всех особенностей строка для запуска имеет вид:
```
nohup /usr/lib/jvm/java-1.7.0/bin/java
-Xmx512m 
-Djetty.home=$OPENSHIFT_DATA_DIR
-Ddatabase.location=${OPENSHIFT_DATA_DIR}teamsysdata
-Ddatabase.backup.location=${OPENSHIFT_DATA_DIR}teamsysdata-backup
-Djava.awt.headless=true -jar ${OPENSHIFT_REPO_DIR}diy/youtrack.jar
${OPENSHIFT_DIY_PORT} &
```
#### Установка и настройка {#установка-и-настройка style="text-align: left;"}

1.  Создадим application с типом diy.
2.  Склонируем репозиторий с application на локальную машину.
3.  Скачаем jar файл последней версию youtrack (Необходимо смотреть на
    требования для памяти, последняя версия подходящая для openshift по
    требованиям памяти = youtrack 5.2.5).
4.  Изменяем ``.openshift/action\_hooks/start.``
5.  Запуск приложения производится следующей командой: 
    ```
    nohup /usr/lib/jvm/java-1.7.0/bin/java 
    -Xmx512m
    -Djetty.home=$OPENSHIFT_DATA_DIR  
    -Ddatabase.location=${OPENSHIFT_DATA_DIR}teamsysdata
    -Ddatabase.backup.location=${OPENSHIFT_DATA_DIR}teamsysdata-backup
    -Djava.awt.headless=true -jar ${OPENSHIFT_REPO_DIR}diy/youtrack.jar ${OPENSHIFT_DIY_PORT} &
    ```    
6. Изменяем ``.openshift/action_hooks/stop.``
7. Остановка приложения производится следующей командами:
   ```
   APP_PID=`ps aux | grep -v grep | grep java | awk '{print $2}'`
   kill -9 $APP_PID > /dev/null 2>&1
   exit 0
   ```
8.  Удаляем все содержимое папки diy и копируем туда скачанный файл
    переименовав его в youtrack.jar.
9.  После чего фиксируем изменения в репозитории
10.  ``git add . ``
11.  ``git commit -m"Deploy YouTrack" ``
12.  ``git push``
13.  После окончания запуска jetty переходим по ссылке, которую указывали при создании application и заканчиваем установку через web.


Размер youtrack.jar - 55 мб

При большом кол-ве коммитов с jar файлом могут возникнуть проблемы с
местом на диске. Т.к. репозиторий храниться в дисковом пространстве
пользователя, для этого не обходимо проверсти очистку репозитория.

Синхронизации с другим сервером для копированием бекапов БД, прежде их
нужно настроить в gui youtrack:

``rsync -avz --delete <your openshit node>:app-root/data/teamsysdata-backup/<path to backup>``

#### Официальная документация

[Документация youtrack 5.x](https://confluence.jetbrains.com/display/YTD5/YouTrack+Documentation)

[Документация openshift](https://docs.openshift.org/latest/welcome/index.html)
