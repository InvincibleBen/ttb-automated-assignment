# 1. Check duplicate items from list A and list B and append to a new list. Using your preferred programming language.
# List A : [1,2,3,5,6,8,9] List B : [3,2,1,5,6,0]

def check_duplicate(A, B):
    C = []
    for X in A:
        if X in B:
            C.append(X)
    return C

print(check_duplicate([1,2,3,5,6,8,9],[3,2,1,5,6,0]))