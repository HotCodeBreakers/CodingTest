# https://www.acmicpc.net/problem/20546
money = int(input())

stockStatus = list(map(int, input().split()))

bnp = money
bnpStockCount = 0
timing = money
timingStockCount = 0

raising = 0
for i in stockStatus:
    if i <= bnp:
        temp = bnp // i
        bnp -= i * temp
        bnpStockCount += temp

for i in range(3, len(stockStatus)):
    if stockStatus[i-3] < stockStatus[i-2] < stockStatus[i-1] < stockStatus[i] and i < len(stockStatus):
        timing += timingStockCount * stockStatus[i]
        timingStockCount = 0
        continue
    if stockStatus[i-3] > stockStatus[i-2] > stockStatus[i-1] > stockStatus[i] and  i < len(stockStatus) and stockStatus[i] <= timing:
        temp = timing // stockStatus[i]
        timing -= stockStatus[i] * temp
        timingStockCount += temp
        continue


k = (bnpStockCount*stockStatus[-1]+bnp) - (timingStockCount*stockStatus[-1]+timing)
if k > 0:
    print("BNP")
elif k < 0:
    print("TIMING")
else:
    print("SAMESAME")