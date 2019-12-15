---
layout: post
title:  A brief intro into ArrayList from JDK.
date:   2018-09-12 08:00:00 +0300
categories: [java, collections]
---

### Theory about an ArrayList

ArrayList is a subset of collections. It implements the interface List, but internally it uses an array as a data structure.  All elements have a position depends on the insert. Each element is accessible by index. The first index is 0. The List instead of the Set can contain duplicates and null values.

When the ArrayList is creating it might have the initial capacity (default capacity = 10).

When you add a new element at the end of the list it is growing dynamically. When a new element is added by index =  capacity + 1, the ArrayList automatically expands the size of the internal array by creating a new internal array with a new size = `(capacity * 3) / 2 + 1`  and coping all elements to the new array after that the new element will be inserted into the new array too.

Inserting into the end of list equals in average constant time `O(1)`. The average because periodically happens operation of expanding which takes more time than inserting one element.

Removing an element from the end of the list takes constant time `O(1)`.
The ArrayList has problems with operations by half of the list. These operations need time for coping elements through the internal array.

Removing elements doesn't trim of array size. If you want to trim size, you should directly invoke trimToSize().

### Main characteristics

* Access by index takes constant time `O(1)`.
* Inserting element into the end of the list on average takes constant time `O(1)`.
* Removing from the end of the list takes constant time `O(1)`.
* Inserting/Removing from/to the middle of the list takes `О(n)`
* The ArrayList can contains duplicates.
* The ArrayList can contain `null`.
* Dynamically increase size by formula `(capacity * 3) / 2 + 1`.
* The need explicitly decrease the size by calling `trimToSize()`.

### Examples of iterating over the ArrayList

Java has several approaches to iterate over a list. The next example contains a few of them:

{% raw %}
<script src="https://gist.github.com/danilkuznetsov/8ec59646554783f0913b24b696e3d5d9.js"></script>
{% endraw %}