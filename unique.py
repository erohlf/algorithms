def unique(lst):
    if len(lst) == 1:
        return lst[0]
    mid = len(lst)//2
    if mid%2 == 0:
        if lst[mid] == lst[mid+1]:
            return unique(lst[mid:])
        else:
            return unique(lst[:mid+1])
    else: 
        if lst[mid] == lst[mid+1]: 
            return unique(lst[:mid])
        else:
            return unique(lst[mid+1:]) 
