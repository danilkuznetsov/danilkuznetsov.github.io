---
layout: page
title:  Установка Git в Windows
permalink: /tips/git/how-to-install-git-in-windows
---

### Необходимые шаги для установки.

1. ** Скачиваем дистрибутив для своей версии OS ** [https://git-scm.com/download/win](http://git-scm.com/download/win)

2. **Запускаем установку.**
   
    ![install git for windows start step 1](/assets/img/git-for-windows/git-windows-start-1.png)
3. **Отмечаем компоненты для установки.**
    
    ![install git for windows step 2](/assets/img/git-for-windows/git-windows-step-2.png)
4. **Указываем необходимость внесения изменений в Path.**
    
    ![install git for windows step 3](/assets/img/git-for-windows/git-windows-step-3.png)
5. **Выбераем схему обработки символов перевода строк.**
    
    ![install git for windows step 4](/assets/img/git-for-windows/git-windows-step-4.png)
6. **Устанавливаем.**
   
   ![install git for windows step 5](/assets/img/git-for-windows/git-windows-step-5.png)
7. **Готово.**
    
    ![install git for windows step 6](/assets/img/git-for-windows/git-windows-finish-6.png)
8. **Прверка установки** ` git --version.`
    
    ![install git for windows step 7](/assets/img/git-for-windows/git-windows-check-version-7.png)

### Настройка клиента после установки.

После установки необходимо провести настройку user.name and user.email, для этого необходимо выполнить в командной строке две команды, подставив нужные значения :

```bash
$ git config --global user.name "YOUR NAME"
```
```bash 
$ git config --global user.email "YOUR EMAIL ADDRESS"
```
