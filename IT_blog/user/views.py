from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.urls import reverse
from user import func
from .models import user
import logging


def register(request):
    if request.method == 'POST':
        try:
            username = str(request.POST['username'])
            password = str(request.POST['password'])
            passwordConfirm = str(request.POST['passwordConfirm'])
            result = func.judgeUsername(username) and func.judgePassword(password)
            if not result:
                raise RuntimeError()
        except RuntimeError:
            return render(request, 'register.html', {'message': u"请用数字、字母、下划线作为用户名密码，并不少于六位不大于三十位"})
        try:
            get = user.objects.get(username=username)
            logging.debug(get.username)
        except:
            if not password == passwordConfirm:
                return render(request, 'register.html', {'message': u"两次输入的密码不一致"})
            else:
                newuser = user(username=username, password=password)
                newuser.save()
                return redirect(reverse('login'))
        return render(request, 'register.html', {'message': u"该用户名已被注册"})
    if 'username' in request.session:
        return redirect(reverse('index'))
    else:
        return render(request, 'register.html', {'message': ""})


def login(request):
    if request.method == 'POST':
        try:
            username = str(request.POST['username'])
            password = str(request.POST['password'])
            result = func.judgeUsername(username) and func.judgePassword(password)
            if not result:
                raise RuntimeError()
        except RuntimeError:
            return render(request, 'login.html', {'message': u"用户名或密码不正确"})
        try:
            get = user.objects.get(username=username)
            logging.debug(get.username)
            if password != get.password:
                raise RuntimeError()
            request.session['username'] = username
            request.session['id'] = get.id
            logging.debug(u'id为' + str(get.id) + u'的用户登录了')
        except:
            return render(request, 'login.html', {'message': u"用户名或密码不正确"})
        return redirect(reverse('index'))
    if 'username' in request.session:
        return redirect(reverse('index'))
    else:
        return render(request, 'login.html', {'messages': ""})

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
