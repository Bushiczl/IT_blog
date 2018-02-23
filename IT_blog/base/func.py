from django.shortcuts import render, redirect
from django.urls import reverse
from django.core.paginator import Paginator
from django.core.mail import send_mail
from django.conf import settings
from base import var as base_var
import random


def judgeStringWhite(input, chSet, maxlen = -1):
    if maxlen != -1:
        strlen = len(str(input))
        if strlen > maxlen:
            return False
    for ch in input:
        if not ch in chSet:
            return False
    return True


def judgeStringBlack(input, chSet, maxlen = -1):
    if maxlen != -1:
        strlen = len(str(input))
        if strlen > maxlen:
            return False
    for ch in input:
        if ch in chSet:
            return False
    return True


def dividePage(reqGetList, input):
    back = {}
    back['pass'] = False
    try:
        p = Paginator(input, base_var.pageMaxnum)
        back['pageCount'] = p.num_pages
        index = int(reqGetList['page'])
        back['output'] = p.page(index).object_list
        back['pass'] = True
    except:
        back['pass'] = False
    return back


def randomString(chSet, len):
    strlen = str(chSet).__len__()
    backString = ""
    for i in range(0, len):
        r = random.randint(0, strlen)
        backString = backString + chSet[r]
    return backString


def sendEmail(title, body, target):
    email_title = title
    email_body = body
    email = target  # 对方的邮箱
    send_status = send_mail(email_title, email_body, settings.EMAIL_FROM, [email])

    if send_status:
        return True
    else:
        return False
