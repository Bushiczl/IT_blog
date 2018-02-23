from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.urls import reverse
from user import func as user_func
from base import func as base_func
from base import var as base_var
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
    list['inputEmail'] = ""
    if request.method == 'POST':
        try:
            username = str(request.POST['username'])
            list['inputUsername'] = username
            password = str(request.POST['password'])
            list['inputPassword'] = password
            email = str(request.POST['email'])
            list['inputEmail'] = email
            identify = str(request.POST['identify'])
            if identify.upper() != str(request.session['identify']).upper():
                list['message'] = u"验证码错误"
                raise RuntimeError()
            try:
                del request.session['identify']
            except:
                pass
            passwordConfirm = str(request.POST['passwordConfirm'])
            result = user_func.judgeUsername(username) and user_func.judgePassword(password)
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
                    text = base_func.randomString(base_var.chNum + base_var.chAlphaLow + base_var.chAlphaHigh, 30)
                    back =base_func.sendEmail(u"博客账号激活",
                                              # 下面链接缺少域名，除此以外没问题
                                              reverse('registerCheck', args=(text,)),
                                              email)

                    if back:
                        request.session[text] = {'username': username, 'password': md5, 'email': email}
                        list['message'] = u"请在邮箱中点击链接激活邮件"
                    else:
                        list['message'] = u"邮件发送失败"
                        raise RuntimeError()
        except:
            pass
    return render(request, 'register.html', list)


def registerCheck(request, text):
    try:
        temp = request.session[text]
        del request.session[text]
        newuser = user(username=temp['username'], password=temp['password'], email=temp['email'])
        newuser.save()
        return HttpResponse('<script>alert("注册成功");location="' + reverse('login') + '"</script>')
    except:
        return HttpResponse('<script>alert("注册失败，请重试");location="' + reverse('register') + '"</script>')


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
            result = user_func.judgeUsername(username) and user_func.judgePassword(password)
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
        except:
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


def changePwd(request):
    if not 'id' in request.session:
        return redirect(reverse('index'))
    else:
        guestId = request.session['id']
    list = {}
    list['message'] = ""
    list['inputOldPassword'] = ""
    list['inputNewPassword'] = ""
    if request.method == 'POST':
        try:
            list["message"] = u"未知错误"

            oldPassword = request.POST['oldPassword']
            logging.debug(u"修改密码输入原密码" + oldPassword)
            list['inputOldPassword'] = oldPassword
            newPassword = request.POST['newPassword']
            logging.debug(u"修改密码输入新密码" + newPassword)
            list['inputNewPassword'] = newPassword
            back = user_func.judgePassword(newPassword)
            if not back:
                list['message'] = u"新密码不符合规范"
                raise RuntimeError()
            confirmPassword = request.POST['confirmPassword']
            logging.debug(u"修改密码输入确认密码" + confirmPassword)
            realPassword = user.objects.get(id=guestId).password
            logging.debug(u"修改密码真密码" + realPassword)
            oldPassword = hashlib.md5(oldPassword.encode('utf-8')).hexdigest()
            if oldPassword != realPassword:
                list['message'] = u"旧密码错误"
                raise RuntimeError()
            if newPassword != confirmPassword:
                list['message'] = u"两次输入的新密码不一致"
                raise RuntimeError()
            newPassword = hashlib.md5(newPassword.encode('utf-8')).hexdigest()
            logging.debug(u"修改密码md5新密码" + newPassword)
            user.objects.filter(id=guestId).update(password=newPassword)
            list['message'] = u"修改成功"
        except:
            pass
    return render(request, 'changePwd.html', list)
