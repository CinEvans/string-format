'''
>>> '{:f}'.format(3.14)
'3.140000'
>>> '{:.0f}'.format(3.14)
'3'
>>> '{:.1f}'.format(3.14)
'3.1'
>>> '{:.2f}'.format(3.14)
'3.14'
>>> '{:.3f}'.format(3.14)
'3.140'

>>> '{:<30}'.format('left aligned')
'left aligned                  '
>>> '{:>30}'.format('right aligned')
'                 right aligned'
>>> '{:^30}'.format('centered')
'           centered           '
>>> '{:*^30}'.format('centered')
'***********centered***********'

>>> '{:+f}; {:+f}'.format(3.14, -3.14)
'+3.140000; -3.140000'
>>> '{: f}; {: f}'.format(3.14, -3.14)
' 3.140000; -3.140000'
>>> '{:-f}; {:-f}'.format(3.14, -3.14)
'3.140000; -3.140000'

>>> 'int: {0:d};  hex: {0:x};  oct: {0:o};  bin: {0:b}'.format(42)
'int: 42;  hex: 2a;  oct: 52;  bin: 101010'
>>> 'int: {0:d};  hex: {0:#x};  oct: {0:#o};  bin: {0:#b}'.format(42)
'int: 42;  hex: 0x2a;  oct: 0o52;  bin: 0b101010'

>>> '{:,}'.format(1234567890)
'1,234,567,890'

>>> points = 19.5
>>> total = 22
>>> 'Correct answers: {:.2%}'.format(points / total)
'Correct answers: 88.64%'

>>> import datetime
>>> d = datetime.datetime(2010, 7, 4, 12, 15, 58)
>>> '{:%Y-%m-%d %H:%M:%S}'.format(d)
'2010-07-04 12:15:58'
'''


if __name__ == '__main__':
    import doctest
    doctest.testmod()
