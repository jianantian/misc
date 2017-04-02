def scope_test():
    def do_local():
        spam = 'local spam'

    def do_nonlocal():
        nonlocal spam
        spam = 'nonlocal spam'

    def do_global():
        global spam  # global 定义全局变量, 相当于在模块层级定义了变量, 而它的优先级要低于 nonlocal (也非全局)
        spam = 'gobal spam'

    spam = 'test spam'

    do_local()
    print('After local assignment: ', spam)

    do_nonlocal()
    print('After nonlocal assignment: ', spam)

    do_global()
    print('After global assignment: ', spam)


scope_test()
print('In global scope: ', spam)
