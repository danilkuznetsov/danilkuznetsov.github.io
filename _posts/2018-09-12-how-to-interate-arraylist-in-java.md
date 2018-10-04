---
layout: post
title:  Интерация по ArrayList в Java
date:   2018-09-12 08:00:00 +0300
categories: [java, collections]
---

### Что это такое?

ArrayList - это список реализованный в виде массива, все элементы в нем отсортированы в порядке добавления.
Доступ к элементам происходит по индексу, нумерации начинается с 0. В отличии от Set может содержать дубликаты и null элементы.

При создании должен быть проинициализирован начальным размером capacity (по умолчанию capacity = 10) , в процессе размер растет динамически.
При записи в позицию capacity +1 элемента происходит динамическое увеличение, а именно создается новый массив кол-во элементов в котором равно (capacity * 3) / 2 + 1 и в него перемещаются все элементы из старого + плюс добавляется новый элемент. В связи с этим свойством вставка в конец происходит в среднем за постоянное время. В среднем т.к периодически происходят операции расширения, которые  занимают больше времени, чем вставка в пустую ячейку. Удаление элемента в конце происходит за постоянное время. Проблемы у ArrayList начинаются при операциях вставки/удаления в середине списка, при этих операциях необходимо передвигать элементы внутри массива. При удалении размер массива не уменьшается, до явного вызова метода  trimToSize().

### Основные характеристики:

* Доступ по индексу к элементу за постоянное время.
* Вставка в конец в среднем за постоянное время.
* Удаление в конце за постоянное время.
* Вставка/удаление в середине за О(n)
* Может содержать дубликаты
* Может содерджать null
* Динамическое увеличивает размер по формуле (capacity * 3) / 2 + 1
* Необходимо явно уменьшать размер с помощью  trimToSize().

### Примеры интерации по ArrayList

В Java существует много способ итерации по списку, рассмотрим их вместе с выводом:

{% raw %}
<script src="https://gist.github.com/danilkuznetsov/8ec59646554783f0913b24b696e3d5d9.js"></script>
{% endraw %}