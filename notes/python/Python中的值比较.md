<!Doctype=Markdown>

# Python 中的对象比较

Python 中比较两个对象主要有两种方法, 即 is 和 ==. 这两者是不一样的.

1. <code>is</code> 比较的是两个对象是否为同一对象, 也即地址是否一致, 所以
<code> a is b </code>
等价于 
<code> id(a) == id(b) </code>.

2. <code>==</code> 比较的是值是否相等, 而这是通过调用对象的<code> \_\_eq__ </code> 方法来实现的.

以下是一些例子:

<code lang=python>
    
    # python 3.6.0

    >>>a = [1,2,3]
    >>>b = [1,2,3]
    >>>a is b
    False
    >>>id(a) == id(b)
    False
    >>>a == b
    True

</code>

注意: 通常情况下不要使用 <code>is</code> 来比较两个 <code>int</code>, <code>str</code>等对象, 其结果非常难以预料, 依赖于 Python 解释器的具体实现. 官方只推荐在类似 <code>is None</code> 的情形下使用.

注意以下代码:


<code lang=python>

    # python 3.6.0

    >>>a = 255
    >>>b = 255
    >>>a is b
    True
    >>>a = 257
    >>>b = 257
    >>>a is b
    False

</code>


这是由于在标准的 CPython 实现中, 为了加快小整数的创建, CPython 预建了一个数组, 存储了 <code>-5</code> 到 <code>256</code> 的整数, 所有该范围内的整数创建时都是引用这个数组中的相应数, 因而在上面的代码中, <code>a</code>, <code>b</code> 取 <code>255</code> 时二者的地址是一样的. **一般而言, 函数的行为依赖于取值范围是很不好的**, 特别是这里 <code>-5</code> 并不是很特别的数, 所以尽量不要使用这一特性. 我们可以看一下同样的代码在 pypy 下的行为.


<code lang=python>
    
    # pypy 5.5.0

    >>>a = 255
    >>>b = 255
    >>>a is b
    True
    >>>a = 257
    >>>b = 257
    >>>a is b
    True
    # 事实上以下结果也成立
    >>>a = 2**1000
    >>>b = 2**1000
    >>>a is b
    True  

</code>


而用 <code>is</code> 比较字符串的时候结果就更难以预料了:


<code lang=python>

    # python 3.6.0
    # pypy 5.5.0 中的结果一致

    >>>a = 'a'
    >>>b = 'a'
    >>>a is b
    True
    >>>a = 'hello'
    >>>b = 'hello'
    >>>a is b
    True
    >>>a = 'a' * 20
    >>>b = 'a' * 20
    >>>a is b
    True
    >>>a = 'a' * 21
    >>>b = 'a' * 21
    >>> a is b
    >>> False
    >>>a = 'a b'
    >>>b = 'a b'
    >>>a is b
    False

</code>


虽然可以看出是有规则的, 但是这种行为并不应该在程序中使用. 事实上我们也并不关心两个字符串在内存中是否是同一个, 因为一般我们只会处理它的值, 而且更关键的是, 字符串在 Python 中是不可变对象, 我们不能修改它的值, 所以 <code>is</code> 在字符串对象上业基本上用不到.

唯一可以**考虑** ( *需要慎重* ) 使用的情形是可变对象, 如 <code>list</code> 和 <code>dict</code> 等, 因为在这种情况下, 两个对象是否一致是我们需要注意的 (可能会修改对象的值), 而且这种情形下 <code>is</code> 的行为跟我们的预期完全一致(当然一致, 否则就出 bug 了).\


<code lang=python>

    # python 3.6.0
    # pypy 5.5.0 结果一致

    >>>a = []
    >>>b = []
    >>>a == b
    True
    >>>a is b
    False
    >>>c = a
    >>>a is c
    True
    >>>import copy
    >>>d = copy.copy(a)
    >>>a is d
    False

</code>


**Tips**: 
 1. 不要在不可变对象上使用 <code>is</code> 进行比较, 结果依赖于解释器
 2. 可以在可变对象上使用 <code>is</code> 进行比较