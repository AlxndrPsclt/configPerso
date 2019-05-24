#!/usr/bin/env python3
# coding=utf-8

from qutescript import userscript
from shutil import copyfile



@userscript
def parse_youtube_url(request):


    copyfile(request.html, '/tmp/savedHTML.html')

    request.send_text(request.as_dict())


if __name__ == '__main__':
    parse_youtube_url()
