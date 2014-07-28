## 0.4.0
![rapydscript language](http://www.pyjeon.com/static/images/rapydscript.png)
* Functions within objects indent properly with new line
```
bob = {
    a: def():
        print('indented')
}
```

* Added anonymous functions ie. def():
* Assigned functions ie. bob = def(): will now indent with new line
```
bob = def():
    print('indented')
```
* added various javascript names to highlighting: console, alert (print and alert snippets added as well)
* xrange was removed as it does not exist in rapydscript
