# 6 A simple cipher is built on the alphabet wheel which has uppercase English letters ['A'-'Z'] written on It:
# Given an encrypted string consisting of English letters ['A'-'Z'] only, decrypt the string by replacing each character with the kth character away on the wheel in the
# counterclockwise direction, Counter-clockwise is the opposite direction in which the hands on a clock usually move. (Using python)

def simple_cipher(j, k):
    a = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
    b = ''
    for i in range(len(j)):
        position = a.index(j[i])
        b += a[position-k]
    return b

print(simple_cipher('VTAOG',2))