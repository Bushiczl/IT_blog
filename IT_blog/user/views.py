from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.urls import reverse
from user import func
from .models import user
import logging
import hashlib


def register(request):
    if 'username' in request.session:
        return redirect(reverse('index'))
    list = {}
    list['message'] = ""
    list['inputUsername'] = ""
    list['inputPassword'] = ""
    if request.method == 'POST':
        try:
            username = str(request.POST['username'])
            list['inputUsername'] = username
            password = str(request.POST['password'])
            list['inputPassword'] = password
            identify = str(request.POST['identify'])
            if identify.upper() != str(request.session['identify']).upper():
                list['message'] = u"验证码错误"
                raise RuntimeError()
            try:
                del request.session['identify']
            except:
                pass
            passwordConfirm = str(request.POST['passwordConfirm'])
            result = func.judgeUsername(username) and func.judgePassword(password)
            if not result:
                list['message'] = u"请用数字、字母、下划线作为用户名密码，并不少于六位不大于三十位"
                raise RuntimeError()
            try:
                get = user.objects.get(username=username)
                list['message'] = u"该用户名已被注册"
                logging.debug(get.username)
            except:
                if not password == passwordConfirm:
                    list['message'] = u"两次输入的密码不一致"
                else:
                    md5 = hashlib.md5(password.encode('utf-8')).hexdigest()
                    newuser = user(username=username, password=md5)
                    newuser.save()
                    return redirect(reverse('login'))
        except RuntimeError:
            pass
    return render(request, 'register.html', list)


def login(request):
    if 'username' in request.session:
        return redirect(reverse('index'))
    list = {}
    list['message'] = ""
    list['inputUsername'] = ""
    list['inputPassword'] = ""
    if request.method == 'POST':
        try:
            username = str(request.POST['username'])
            list['inputUsername'] = username
            password = str(request.POST['password'])
            list['inputPassword'] = password
            identify = str(request.POST['identify'])
            if identify.upper() != str(request.session['identify']).upper():
                list['message'] = u"验证码错误"
                raise RuntimeError()
            try:
                del request.session['identify']
            except:
                pass
            result = func.judgeUsername(username) and func.judgePassword(password)
            if not result:
                list['message'] = u"用户名或密码不正确"
                raise RuntimeError()
            try:
                get = user.objects.get(username=username)
                logging.debug(get.username)
                md5 = hashlib.md5(password.encode('utf-8')).hexdigest()
                if md5 != get.password:
                    list['message'] = u"用户名或密码不正确"
                    raise RuntimeError()
                request.session['username'] = username
                request.session['id'] = get.id
                logging.debug(u'id为' + str(get.id) + u'的用户登录了')
                return redirect(reverse('index'))
            except:
                pass
        except RuntimeError:
            pass
    return render(request, 'login.html', list)

def logout(request):
    try:
        del request.session['username']
    except:
        pass
    try:
        del request.session['id']
    except:
        pass
    return HttpResponse('<script>window.location.href = document.referrer;</script>')
