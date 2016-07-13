#!/usr/bin/python3

import sys
from concurrent.futures import ThreadPoolExecutor
# import time
# import random

import pycurl

# def f(name):
#     for n in range(5):
#         print('%s %d' % (name, n))
#         time.sleep(random.random() * random.random() * 10)
#     return random.random()

def download(c, r):
    c.setopt(c.RANGE, r)
    c.perform()
    return 0

def new_client(url, file):
    c = pycurl.Curl()
    c.setopt(c.URL, url)
    c.setopt(c.WRITEDATA, file)
    return c


if __name__ == '__main__':
    url = sys.argv[1]
    fsize = int(sys.argv[2])
    fs = []
    for i in range(2):
        fs.append(open(str(i)+'.part', 'wb'))
    executor = ThreadPoolExecutor(max_workers=2)
    a = executor.submit(download, new_client(url, fs[0]), '0-'+str(fsize // 2))
    b = executor.submit(download, new_client(url, fs[1]), str(fsize//2+1)+'-')
    a.result()
    b.result()
