import os
from django.shortcuts import render
from django.http import HttpResponse
from base import func as base_func
from base import var as base_var
from blog import func as blog_func
from PIL import Image, ImageDraw, ImageFont, ImageFilter
import random


def index(request):
    list = {}
    list['articles'] = {}

    back = blog_func.getAllArticle()

    if back['pass']:
        back = base_func.dividePage(request.GET, back['get'])
        try:
            list['pageCount'] = back['pageCount']
        except:
            list['pageCount'] = 1
        if back['pass']:
            list['articles'] = back['output']

    return render(request, 'index.html', list)


def identifyCodePicture(request):
    width, height = base_var.identifySize
    image = Image.new('RGBA', (width, height), base_var.identifyBgcolor)
    font = ImageFont.truetype("arial", size=25)
    draw = ImageDraw.Draw(image)
    text = base_func.randomString(base_var.chNum + base_var.chAlphaHigh + base_var.chAlphaLow, base_var.identifyLen)
    draw.text((1, 1),
              text,
              font=font,
              fill=base_var.identifyFontcolor)
    if base_var.identifyDraw_line:
        for i in range(0, random.randint(1, base_var.identifyLine_number)):
            begin = (random.randint(0, width), random.randint(0, height))
            end = (random.randint(0, width), random.randint(0, height))
            draw.line([begin, end], fill=base_var.identifyLinecolor)
    image = image.transform((width + 20, height + 10), Image.AFFINE, (1, -0.3, 0, -0.1, 1, 0), Image.BILINEAR)  # 创建扭曲
    image = image.filter(ImageFilter.EDGE_ENHANCE_MORE)  # 滤镜，边界加强
    request.session['identify'] = text
    try:
        image.save(base_var.identifyPath)
    except:
        try:
            image.save(base_var.identifyPath, "PNG")
        except:
            os.makedirs(base_var.identifyDir)
            image.save(base_var.identifyPath, "PNG")
    image = open(base_var.identifyPath, "rb").read()
    return HttpResponse(image, content_type="image/png")
